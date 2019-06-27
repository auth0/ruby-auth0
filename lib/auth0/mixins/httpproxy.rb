module Auth0
  module Mixins
    # here's the proxy for Rest calls based on rest-client, we're building all request on that gem
    # for now, if you want to feel free to use your own http client
    module HTTPProxy
      attr_accessor :headers, :base_uri, :timeout

      # proxying requests from instance methods to HTTP class methods
      %i(get post post_file put patch delete delete_with_body).each do |method|
        define_method(method) do |path, body = {}, extra_headers = {}|
          safe_path = URI.escape(path)
          body = body.delete_if { |_, v| v.nil? }
          result = if method == :get
                     # Mutate the headers property to add parameters.
                     add_headers({params: body})
                     # Merge custom headers into existing ones for this req.
                     # This prevents future calls from using them.
                     get_headers = headers.merge extra_headers
                     # Make the call with extra_headers, if provided.
                     call(:get, url(safe_path), timeout, get_headers)
                   elsif method == :delete
                     call(:delete, url(safe_path), timeout, add_headers({params: body}))
                   elsif method == :delete_with_body
                     call(:delete, url(safe_path), timeout, headers, body)
                   elsif method == :post_file
                     body.merge!(multipart: true)
                     call(:post, url(safe_path), timeout, headers, body)
                   else
                     call(method, url(safe_path), timeout, headers, body.to_json)
                   end
          case result.code
          when 200...226 then safe_parse_json(result.body)
          when 400       then raise Auth0::BadRequest, result.to_s
          when 401       then raise Auth0::Unauthorized, result.body
          when 403       then raise Auth0::AccessDenied, result.body
          when 404       then raise Auth0::NotFound, result.body
          when 500       then raise Auth0::ServerError, result.body
          else                raise Auth0::Unsupported, result.body
          end
        end
      end

      def url(path)
        "#{base_uri}#{path}"
      end

      def add_headers(h = {})
        raise ArgumentError, 'Headers must be an object which responds to #to_hash' unless h.respond_to?(:to_hash)
        @headers ||= {}
        @headers.merge!(h.to_hash)
      end

      def safe_parse_json(body)
        JSON.parse(body.to_s)
      rescue JSON::ParserError
        body
      end

      def call(method, url, timeout, headers, body = nil)
        RestClient::Request.execute(
          method: method,
          url: url,
          timeout: timeout,
          headers: headers,
          payload: body
        )
      rescue RestClient::Exception => e
        case e
        when RestClient::RequestTimeout
          raise Auth0::RequestTimeout
        else
          return e.response
        end
      end
    end
  end
end

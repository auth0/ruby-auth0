module Auth0
  module Mixins
    # here's the proxy for HTTParty, we're building all request on that gem
    # for now, if you want to feel free to use your own http client
    module HTTPartyProxy
      # proxying requests from instance methods to HTTParty class methods
      %i(get post post_file put patch delete).each do |method|
        define_method(method) do |path, body = {}|
          safe_path = URI.escape(path)
          body = body.delete_if { |_, v| v.nil? }
          result = if method == :get
                     self.class.send(method, safe_path, query: body)
                   elsif method == :post_file
                     self.class.send(:post, safe_path, body: body, detect_mime_type: true)
                   else
                     self.class.send(method, safe_path, body: body.to_json)
                   end
          case result.code
          when 200...226 then safe_parse_json(result.body)
          when 400       then fail Auth0::BadRequest, result.body
          when 401       then fail Auth0::Unauthorized, result.body
          when 403       then fail Auth0::AccessDenied, result.body
          when 404       then fail Auth0::NotFound, result.body
          when 500       then fail Auth0::ServerError, result.body
          else                fail Auth0::Unsupported, result.body
          end
        end
      end

      def safe_parse_json(body)
        JSON.parse(body.to_s)
      rescue JSON::ParserError
        body
      end
    end
  end
end

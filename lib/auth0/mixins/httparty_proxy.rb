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
          if method == :get
            result = self.class.send(method, safe_path, query: body)
          elsif method == :post_file
            result = self.class.send(:post, safe_path, body: body, detect_mime_type: true)
          else
            result = self.class.send(method, safe_path, body: body.to_json)
          end
          response_body =
          begin
            JSON.parse(result.body.to_s)
          rescue JSON::ParserError
            result.body
          end
          case result.code
          when 200...226 then response_body
          when 400 then fail Auth0::BadRequest, response_body.to_json
          when 401 then fail Auth0::Unauthorized, response_body.to_json
          when 403 then fail Auth0::AccessDenied, response_body.to_json
          when 404 then fail Auth0::NotFound, response_body.to_json
          when 500 then fail Auth0::ServerError, response_body.to_json
          else
            fail Auth0::Unsupported, response_body.to_json
          end
        end
      end
    end
  end
end

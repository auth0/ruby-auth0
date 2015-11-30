module Auth0
  module Mixins
    # here's the proxy for HTTParty, we're building all request on that gem for now, if you want to feel free to use your own http client
    module HTTPartyProxy
      # proxying requests from instance methods to HTTParty class methods
      %i(get post put patch delete).each do |method|
        define_method(method) do |path, body = {}|
          safe_path = URI.escape(path)
          body = body.delete_if { |_k, v| v.nil? }
          if method == :get
            result = self.class.send(method, safe_path, query: body)
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
          when 400 then fail Auth0::BadRequest, response_body
          when 401 then fail Auth0::Unauthorized, response_body
          when 403 then fail Auth0::AccessDenied, response_body
          when 404 then fail Auth0::NotFound, response_body
          when 500 then fail Auth0::ServerError, response_body
          else
            fail Auth0::Unsupported, response_body
          end
        end
      end
    end
  end
end

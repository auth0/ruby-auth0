module Auth0
  module Api
    module V1
      # https://auth0.com/docs/api#rules
      module Rules
        # https://auth0.com/docs/api#!#get--api-rules
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Rules
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def rules
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = '/api/rules'
          get(path)
        end

        alias get_rules rules

        # https://auth0.com/docs/api#!#post--api-rules
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Rules
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def create_rule(name, script, order = nil, status = true)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = '/api/rules'
          request_params = {
            name: name,
            status: status,
            script: script,
            order: order
          }
          post(path, request_params)
        end

        # https://auth0.com/docs/api#!#put--api-rules--rule-name-
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Rules
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def update_rule(name, script, order = nil, status = true)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/rules/#{name}"
          request_params = {
            status: status,
            script: script,
            order: order
          }
          put(path, request_params)
        end

        # https://auth0.com/docs/api#!#delete--api-rules--rule-name-
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Rules
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def delete_rule(name)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/rules/#{name}"
          delete(path)
        end
      end
    end
  end
end

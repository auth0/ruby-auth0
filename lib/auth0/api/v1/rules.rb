module Auth0
  module Api
    module V1
      # https://auth0.com/docs/api#rules
      module Rules
        # https://auth0.com/docs/api#!#get--api-rules
        def rules
          path = '/api/rules'
          get(path)
        end

        alias get_rules rules

        # https://auth0.com/docs/api#!#post--api-rules
        def create_rule(name, script, order = nil, status = true)
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
        def update_rule(name, script, order = nil, status = true)
          path = "/api/rules/#{name}"
          request_params = {
            status: status,
            script: script,
            order: order
          }
          put(path, request_params)
        end

        # https://auth0.com/docs/api#!#delete--api-rules--rule-name-
        def delete_rule(name)
          path = "/api/rules/#{name}"
          delete(path)
        end
      end
    end
  end
end

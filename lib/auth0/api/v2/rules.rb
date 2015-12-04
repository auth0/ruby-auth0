module Auth0
  module Api
    module V2
      # https://auth0.com/docs/api/v2#rules
      module Rules
        # https://auth0.com/docs/api/v2#!/Rules/get_rules
        def rules(options = {})
          request_params = {
            enabled:          options.fetch(:enabled, nil),
            fields:           options.fetch(:fields, nil),
            include_fields:   options.fetch(:include_fields, nil),
            stage:            options.fetch(:stage, nil)
          }
          path = '/api/v2/rules'
          get(path, request_params)
        end

        alias_method :get_rules, :rules

        # https://auth0.com/docs/api/v2#!/Rules/get_rules_by_id
        def rule(rule_id, options = {})
          fail Auth0::InvalidParameter, 'Must supply a valid rule id' if rule_id.to_s.empty?
          path = "/api/v2/rules/#{rule_id}"
          request_params = {
            fields:   options.fetch(:fields, nil),
            include_fields:   options.fetch(:include_fields, nil)
          }
          get(path, request_params)
        end

        alias_method :get_rule, :rule

        # https://auth0.com/docs/api/v2#!/Rules/post_rules
        def create_rule(name, script, order = nil, enabled = true, stage = 'login_success')
          fail Auth0::InvalidParameter, 'Must supply a valid name' if name.to_s.empty?
          fail Auth0::InvalidParameter, 'Must supply a valid script' if script.to_s.empty?
          path = '/api/v2/rules'
          request_params = {
            name: name,
            enabled: enabled,
            script: script,
            order: order,
            stage: stage
          }
          post(path, request_params)
        end

        # https://auth0.com/docs/api/v2#!/Rules/patch_rules_by_id
        def update_rule(rule_id, fields_to_update = {})
          fail Auth0::InvalidParameter, 'Must supply a valid rule id' if rule_id.to_s.empty?

          path = "/api/v2/rules/#{rule_id}"
          patch(path, fields_to_update)
        end

        # https://auth0.com/docs/api/v2#!/Rules/delete_rules_by_id
        def delete_rule(rule_id)
          fail Auth0::InvalidParameter, 'Must supply a valid rule id' if rule_id.to_s.empty?
          path = "/api/v2/rules/#{rule_id}"
          delete(path)
        end
      end
    end
  end
end

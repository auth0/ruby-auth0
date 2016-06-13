module Auth0
  module Api
    module V2
      # Methods to use the rules endpoints
      module Rules
        attr_reader :rules_path

        # Retrieves a list of all rules. Accepts a list of fields to include or exclude.
        # The enabled parameter can be specified to get enabled or disabled rules.
        # The rule's stage of executing could be set to the following values login_success,
        # login_failure or pre_authorize
        # @see https://auth0.com/docs/api/v2#!/Rules/get_rules
        # @param enabled [boolean] If provided retrieves rules that match the value, otherwise all rules are retrieved.
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        # @param stage [string] Retrieves rules that match the execution stage (defaults to login_success).
        #
        # @return [json] Returns the existing rules.
        def rules(enabled: nil, fields: nil, include_fields: nil, stage: nil)
          request_params = {
            enabled:          enabled,
            fields:           fields,
            include_fields:   include_fields,
            stage:            stage
          }
          get(rules_path, request_params)
        end

        alias get_rules rules

        # Retrieves a rule by its ID. Accepts a list of fields to include or exclude in the result.
        # @see https://auth0.com/docs/api/v2#!/Rules/get_rules_by_id
        # @param rule_id [string] The id of the rule to retrieve.
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        #
        # @return [json] Returns the rule.
        def rule(rule_id, fields: nil, include_fields: nil)
          raise Auth0::InvalidParameter, 'Must supply a valid rule id' if rule_id.to_s.empty?
          path = "#{rules_path}/#{rule_id}"
          request_params = {
            fields:   fields,
            include_fields:   include_fields
          }
          get(path, request_params)
        end

        alias get_rule rule

        # Creates a new rule according to the JSON object received in body.
        # @see https://auth0.com/docs/api/v2#!/Rules/post_rules
        # @param name [string] The name of the rule. Can only contain alphanumeric characters, spaces and '-'.
        # @param script [string] A script that contains the rule's code.
        # @param order [integer] The rule's order in relation to other rules. A rule with a lower order than another rule
        # executes first. If no order is provided it will automatically be one greater than the current maximum.
        # @param enabled [string] True if the rule is enabled, false otherwise.
        # @param stage [string] The rule's execution stage 'login_success' or 'login_failure' or 'pre_authorize' or
        # 'user_registration' or 'user_blocked'.
        #
        # @return [json] Returns the created rule.
        def create_rule(name, script, order = nil, enabled = true, stage = 'login_success')
          raise Auth0::InvalidParameter, 'Must supply a valid name' if name.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid script' if script.to_s.empty?
          request_params = {
            name: name,
            enabled: enabled,
            script: script,
            order: order,
            stage: stage
          }
          post(rules_path, request_params)
        end

        # Updates a rule.
        # @see https://auth0.com/docs/api/v2#!/Rules/patch_rules_by_id
        # @param rule_id [string] The id of the rule to retrieve.
        # @param fields_to_update [hash] The Hash fields_to_update used to define the rule's properties.
        #
        # @return [json] Returns the updated rule.
        def update_rule(rule_id, fields_to_update = {})
          raise Auth0::InvalidParameter, 'Must supply a valid rule id' if rule_id.to_s.empty?

          path = "#{rules_path}/#{rule_id}"
          patch(path, fields_to_update)
        end

        # Deletes a rule.
        # @see https://auth0.com/docs/api/v2#!/Rules/delete_rules_by_id
        # @param rule_id [string] The id of the rule to delete.
        def delete_rule(rule_id)
          raise Auth0::InvalidParameter, 'Must supply a valid rule id' if rule_id.to_s.empty?
          path = "#{rules_path}/#{rule_id}"
          delete(path)
        end

        private

        # Rules API path
        def rules_path
          @rules_path ||= '/api/v2/rules'
        end
      end
    end
  end
end

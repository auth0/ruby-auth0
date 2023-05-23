module Auth0
  module Api
    module V2
      # Methods to use the actions endpoints
      module Actions
        include Auth0::Mixins::Validation

        attr_reader :actions_path

        # Get all actions.
        # @see https://auth0.com/docs/api/management/v2#!/Actions/get_actions
        # @param trigger_id [string] An actions extensibility point.
        # @param action_name [string] The name of the action to retrieve.
        # @param deployed [boolean] filter to only retrieve actions that are deployed.
        # @param per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        # @param page [integer] The page number. Zero based.
        # @param installed [boolean] When true, return only installed actions. When false, return only custom actions. Returns all actions by default.
        # @return [json] Actions and pagination info
        def actions(trigger_id: nil, action_name: nil, deployed: nil, per_page: nil, page: nil, installed: nil)
          request_params = {
            trigger_id: trigger_id,
            action_name: action_name,
            deployed: deployed,
            per_page: per_page,
            page: page,
            installed: installed
          }
          path = "#{actions_path}/actions"
          get(path, request_params)
        end
        alias get_actions actions

        # Create a new action.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/post_action
        # @param body [hash] See https://auth0.com/docs/api/management/v2/#!/actions/post_action for available options
        # @return [json] Returns the created action.
        def create_action(body = {})
          path = "#{actions_path}/actions"
          post(path, body)
        end

        # Retrieve the set of triggers currently available within actions. A trigger is an extensibility point to which actions can be bound.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/get_triggers
        #
        # @return [json] Returns triggers of the action
        def actions_triggers
          path = "#{actions_path}/triggers"
          get(path)
        end

        # Get an action by id.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/get_action
        # @param action_id [string] The action_id of the user to retrieve.
        #
        # @return [json] Returns the action with the given action_id if it exists.
        def action(action_id)
          raise Auth0::MissingActionId, 'Must supply a valid action_id' if action_id.to_s.empty?
          path = "#{actions_path}/actions/#{action_id}"
          get(path)
        end
        alias get_action action


        # Deletes a single action given its id
        # @see https://auth0.com/docs/api/management/v2/#!/actions/delete_action
        # @param action_id [string] The action ID
        # @param force [boolean] Force action deletion detaching bindings (defaults to false)
        def delete_action(action_id, force=false)
          raise Auth0::MissingActionId, 'Must supply a valid action_id' if action_id.to_s.empty?
          path = "#{actions_path}/actions/#{action_id}"
          delete(path, { force: force })
        end

        # Update an existing action.
        # @see https://auth0.com/docs/api/management/v2/#!/Actions/patch_action
        # @param action_id [string] The action ID
        # @param body [hash] The optional parameters to update.
        #
        # @return [json] Returns the updated user.
        def patch_action(action_id, body)
          raise Auth0::MissingActionId, 'Must supply a valid action_id' if action_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty? || body.empty?
          path = "#{actions_path}/actions/#{action_id}"
          patch(path, body)
        end
        alias update_action patch_action

        # Retrieve information about a specific execution of a trigger.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/get_action
        # @param execution_id [string] The ID of the exeution to retrieve.
        #
        # @return [json] Returns the action with the given execution_id if it exists.
        def execution(execution_id)
          raise Auth0::MissingExecutionId, 'Must supply a valid execution_id' if execution_id.to_s.empty?
          path = "#{actions_path}/executions/#{execution_id}"
          get(path)
        end
        alias get_execution execution

        # Retrieve all of an action's versions.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/versions
        # @param action_id [string] The ID of the action.
        # @param per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        # @param page [integer] The page number. Zero based
        #
        # @return [json] Returns the action with the given execution_id if it exists.
        def actions_versions(action_id, page: nil, per_page: nil)
          raise Auth0::MissingActionId, 'Must supply a valid action_id' if action_id.to_s.empty?
          path = "#{actions_path}/actions/#{action_id}/versions"
          request_params = {
            per_page: per_page,
            page: page
          }

          get(path, request_params)
        end
        alias get_actions_versions actions_versions

        # Retrieve the actions that are bound to a trigger.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/get_bindings
        # @param trigger_id [string] An actions extensibility point.
        # @param per_page [integer] The amount of entries per page. Default: 50. Max value: 100.
        # @param page [integer] The page number. Zero based
        #
        # @return [json] Returns the action with the given trigger_id if it exists.
        def trigger_bindings(trigger_id, page: nil, per_page: nil)
          raise Auth0::MissingTriggerId, 'Must supply a valid trigger_id' if trigger_id.to_s.empty?
          path = "#{actions_path}/triggers/#{trigger_id}/bindings"
          request_params = {
            per_page: per_page,
            page: page
          }

          get(path, request_params)
        end
        alias get_trigger_bindings trigger_bindings

        # Update the actions that are bound (i.e. attached) to a trigger.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/patch_bindings
        # @param trigger_id [string] An actions extensibility point.
        # @param body [hash] The optional parameters to update.
        #
        # @return [json] Returns the bindings that were updated.
        def patch_trigger_bindings(trigger_id, body = nil)
          raise Auth0::MissingTriggerId, 'Must supply a valid trigger_id' if trigger_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty? || body.empty?
          path = "#{actions_path}/triggers/#{trigger_id}/bindings"
          patch(path, body)
        end
        alias update_trigger_bindings patch_trigger_bindings

        # Retrieve a specific version of an action
        # @see https://auth0.com/docs/api/management/v2/#!/actions/get_action_version
        # @param action_id [string]  The ID of the action.
        # @param version_id [string]  The ID of the action version.
        #
        # @return [json] Returns the action.
        def action_by_version(action_id, version_id)
          raise Auth0::MissingActionId, 'Must supply a valid action_id' if action_id.to_s.empty?
          raise Auth0::MissingVersionId, 'Must supply a valid version_id' if version_id.to_s.empty?
          path = "#{actions_path}/actions/#{action_id}/versions/#{version_id}"
          get(path)
        end
        alias get_action_by_version action_by_version 

        # Deploy an action.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/post_deploy_action
        # @param action_id [string]  The ID of the action.
        # @return [json] Returns the created action.
        def deploy_action(action_id)
          raise Auth0::MissingActionId, 'Must supply a valid action_id' if action_id.to_s.empty?
          path = "#{actions_path}/actions/#{action_id}/deploy"
          post(path)
        end

        # Test an action.
        # @see https://auth0.com/docs/api/management/v2/#!/actions/post_test_action
        # @param action_id [string]  The ID of the action.
        # @param body [hash] See https://auth0.com/docs/api/management/v2/#!/actions/post_test_action for available options
        # @return [json] Returns the created action.
        def test_action(action_id, body = {})
          raise Auth0::MissingActionId, 'Must supply a valid action_id' if action_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty? || body.empty?
          path = "#{actions_path}/actions/#{action_id}/test"
          post(path, body)
        end

        # Performs the equivalent of a roll-back of an action to an earlier, specified version. 
        # @see https://auth0.com/docs/api/management/v2/#!/actions/post_deploy_draft_version
        # @param action_id [string]  The ID of the action.
        # @param version_id [string]  The ID of the action version.
        # @return [json] Returns the created action.
        def rollback_action(action_id, version_id)
          raise Auth0::MissingActionId, 'Must supply a valid action_id' if action_id.to_s.empty?
          raise Auth0::MissingVersionId, 'Must supply a valid version_id' if version_id.to_s.empty?
          path = "#{actions_path}/actions/#{action_id}/versions/#{version_id}/deploy"
          post(path)
        end

        private
        # actions API path
        def actions_path
          @actions_path ||= '/api/v2/actions'
        end
      end
    end
  end
end

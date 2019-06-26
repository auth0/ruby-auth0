require 'auth0/mixins/validation'

module Auth0
  module Api
    module V2
      # Methods to use the users endpoints
      module Roles
        include Auth0::Mixins::Validation

        attr_reader :roles_path

        private

        # Users API path
        def roles_path
          @roles_path ||= '/api/v2/roles'
        end
      end
    end
  end
end

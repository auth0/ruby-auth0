# frozen_string_literal: true

module Auth0
  module Types
    module NetworkACLRuleScopeEnum
      extend Auth0::Internal::Types::Enum

      MANAGEMENT = "management"
      AUTHENTICATION = "authentication"
      TENANT = "tenant"
      DYNAMIC_CLIENT_REGISTRATION = "dynamic_client_registration"
    end
  end
end

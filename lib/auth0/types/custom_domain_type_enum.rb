# frozen_string_literal: true

module Auth0
  module Types
    module CustomDomainTypeEnum
      extend Auth0::Internal::Types::Enum

      AUTH0MANAGED_CERTS = "auth0_managed_certs"
      SELF_MANAGED_CERTS = "self_managed_certs"
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Settings related to OIDC RP-initiated Logout
    class TenantOidcLogoutSettings < Internal::Types::Model
      field :rp_logout_end_session_endpoint_discovery, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # SCIM provisioning settings.
    class ConnectionProfileProvisioningSCIM < Internal::Types::Model
      field :tokens, -> { Auth0::Types::ConnectionProfileProvisioningSCIMTokens }, optional: false, nullable: false
    end
  end
end

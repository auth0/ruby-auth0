# frozen_string_literal: true

module Auth0
  module Types
    # SCIM token settings for connections created from this profile.
    class ConnectionProfileProvisioningSCIMTokens < Internal::Types::Model
      field :scopes, -> { Internal::Types::Array[Auth0::Types::ConnectionProfileProvisioningSCIMTokenScopeEnum] }, optional: false, nullable: false

      field :default_expiry, -> { Integer }, optional: true, nullable: false

      field :max_allowed_expiry, -> { Integer }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Default OIDC support configuration applied to matched clients.
    class ClientProfileClientConfigurationOidcSupport < Internal::Types::Model
      field :default_value, -> { Auth0::Types::ClientProfileClientConfigurationOidcSupportDefaultValue }, optional: false, nullable: false
    end
  end
end

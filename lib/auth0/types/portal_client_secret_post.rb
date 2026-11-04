# frozen_string_literal: true

module Auth0
  module Types
    class PortalClientSecretPost < Internal::Types::Model
      field :token_endpoint_auth_method, -> { Auth0::Types::PortalClientSecretPostTokenEndpointAuthMethod }, optional: false, nullable: false

      field :client_id, -> { String }, optional: false, nullable: false
    end
  end
end

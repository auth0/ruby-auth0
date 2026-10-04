# frozen_string_literal: true

module Auth0
  module Types
    # HTTP Message Signature configuration.
    class NetworkAclHttpMessageSignature < Internal::Types::Model
      field :keys, -> { Internal::Types::Array[Auth0::Types::NetworkAclHttpMessageSignatureKey] }, optional: false, nullable: false
    end
  end
end

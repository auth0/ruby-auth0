# frozen_string_literal: true

module Auth0
  module CustomDomains
    module Types
      class UpdateCustomDomainRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :tls_policy, -> { Auth0::Types::CustomDomainTLSPolicyEnum }, optional: true, nullable: false
        field :custom_client_ip_header, -> { Auth0::Types::CustomDomainCustomClientIPHeaderEnum }, optional: true, nullable: false
        field :domain_metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
        field :relying_party_identifier, -> { String }, optional: true, nullable: false
      end
    end
  end
end

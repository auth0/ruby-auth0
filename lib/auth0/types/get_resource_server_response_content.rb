# frozen_string_literal: true

module Auth0
  module Types
    class GetResourceServerResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :is_system, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :identifier, -> { String }, optional: true, nullable: false
      field :scopes, -> { Internal::Types::Array[Auth0::Types::ResourceServerScope] }, optional: true, nullable: false
      field :signing_alg, -> { Auth0::Types::SigningAlgorithmEnum }, optional: true, nullable: false
      field :signing_secret, -> { String }, optional: true, nullable: false
      field :allow_offline_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allow_online_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :skip_consent_for_verifiable_first_party_clients, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :token_lifetime, -> { Integer }, optional: true, nullable: false
      field :token_lifetime_for_web, -> { Integer }, optional: true, nullable: false
      field :enforce_policies, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :token_dialect, -> { Auth0::Types::ResourceServerTokenDialectResponseEnum }, optional: true, nullable: false
      field :token_encryption, -> { Auth0::Types::ResourceServerTokenEncryption }, optional: true, nullable: false
      field :consent_policy, -> { Auth0::Types::ResourceServerConsentPolicyEnum }, optional: true, nullable: false
      field :authorization_details, -> { Internal::Types::Array[Object] }, optional: true, nullable: false
      field :proof_of_possession, -> { Auth0::Types::ResourceServerProofOfPossession }, optional: true, nullable: false
      field :subject_type_authorization, -> { Auth0::Types::ResourceServerSubjectTypeAuthorization }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
    end
  end
end

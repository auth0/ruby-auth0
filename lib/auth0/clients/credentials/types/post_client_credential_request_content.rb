# frozen_string_literal: true

module Auth0
  module Clients
    module Credentials
      module Types
        class PostClientCredentialRequestContent < Internal::Types::Model
          field :client_id, -> { String }, optional: false, nullable: false
          field :credential_type, -> { Auth0::Types::ClientCredentialTypeEnum }, optional: false, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :subject_dn, -> { String }, optional: true, nullable: false
          field :pem, -> { String }, optional: true, nullable: false
          field :alg, -> { Auth0::Types::PublicKeyCredentialAlgorithmEnum }, optional: true, nullable: false
          field :parse_expiry_from_cert, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :expires_at, -> { String }, optional: true, nullable: false
          field :kid, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end

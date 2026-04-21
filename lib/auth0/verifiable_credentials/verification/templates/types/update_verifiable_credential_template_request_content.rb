# frozen_string_literal: true

module Auth0
  module VerifiableCredentials
    module Verification
      module Templates
        module Types
          class UpdateVerifiableCredentialTemplateRequestContent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :name, -> { String }, optional: true, nullable: false
            field :type, -> { String }, optional: true, nullable: false
            field :dialect, -> { String }, optional: true, nullable: false
            field :presentation, -> { Auth0::Types::MdlPresentationRequest }, optional: true, nullable: false
            field :well_known_trusted_issuers, -> { String }, optional: true, nullable: false
            field :version, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end

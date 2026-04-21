# frozen_string_literal: true

module Auth0
  module VerifiableCredentials
    module Verification
      module Templates
        module Types
          class CreateVerifiableCredentialTemplateRequestContent < Internal::Types::Model
            field :name, -> { String }, optional: false, nullable: false
            field :type, -> { String }, optional: false, nullable: false
            field :dialect, -> { String }, optional: false, nullable: false
            field :presentation, -> { Auth0::Types::MdlPresentationRequest }, optional: false, nullable: false
            field :custom_certificate_authority, -> { String }, optional: true, nullable: false
            field :well_known_trusted_issuers, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class UpdateVerifiableCredentialTemplateResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :dialect, -> { String }, optional: true, nullable: false
      field :presentation, -> { Auth0::Types::MdlPresentationRequest }, optional: true, nullable: false
      field :custom_certificate_authority, -> { String }, optional: true, nullable: false
      field :well_known_trusted_issuers, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end

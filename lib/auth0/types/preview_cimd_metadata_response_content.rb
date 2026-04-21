# frozen_string_literal: true

module Auth0
  module Types
    class PreviewCimdMetadataResponseContent < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :validation, -> { Auth0::Types::CimdValidationResult }, optional: true, nullable: false
      field :mapped_fields, -> { Auth0::Types::CimdMappedClientFields }, optional: true, nullable: false
    end
  end
end

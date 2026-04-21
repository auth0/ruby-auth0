# frozen_string_literal: true

module Auth0
  module Types
    # Response after successfully registering or updating a CIMD client
    class RegisterCimdClientResponseContent < Internal::Types::Model
      field :client_id, -> { String }, optional: false, nullable: false
      field :mapped_fields, -> { Auth0::Types::CimdMappedClientFields }, optional: false, nullable: false
      field :validation, -> { Auth0::Types::CimdValidationResult }, optional: false, nullable: false
    end
  end
end

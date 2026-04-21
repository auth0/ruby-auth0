# frozen_string_literal: true

module Auth0
  module Types
    class ListVerifiableCredentialTemplatesPaginatedResponseContent < Internal::Types::Model
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :templates, -> { Internal::Types::Array[Auth0::Types::VerifiableCredentialTemplateResponse] }, optional: true, nullable: false
    end
  end
end

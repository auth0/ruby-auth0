# frozen_string_literal: true

module Auth0
  module Types
    class GetJobErrorResponseContent < Internal::Types::Model
      field :user, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Auth0::Types::GetJobImportUserError] }, optional: true, nullable: false
    end
  end
end

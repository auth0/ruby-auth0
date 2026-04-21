# frozen_string_literal: true

module Auth0
  module TokenExchangeProfiles
    module Types
      class UpdateTokenExchangeProfileRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :subject_token_type, -> { String }, optional: true, nullable: false
      end
    end
  end
end

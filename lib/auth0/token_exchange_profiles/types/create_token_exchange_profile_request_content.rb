# frozen_string_literal: true

module Auth0
  module TokenExchangeProfiles
    module Types
      class CreateTokenExchangeProfileRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :subject_token_type, -> { String }, optional: false, nullable: false
        field :action_id, -> { String }, optional: false, nullable: false
        field :type, -> { Auth0::Types::TokenExchangeProfileTypeEnum }, optional: false, nullable: false
      end
    end
  end
end

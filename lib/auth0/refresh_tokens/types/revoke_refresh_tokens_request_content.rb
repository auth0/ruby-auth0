# frozen_string_literal: true

module Auth0
  module RefreshTokens
    module Types
      class RevokeRefreshTokensRequestContent < Internal::Types::Model
        field :ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :client_id, -> { String }, optional: true, nullable: false

        field :audience, -> { String }, optional: true, nullable: false
      end
    end
  end
end

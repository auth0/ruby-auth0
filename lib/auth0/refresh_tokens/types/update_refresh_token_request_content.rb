# frozen_string_literal: true

module Auth0
  module RefreshTokens
    module Types
      class UpdateRefreshTokenRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :refresh_token_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end

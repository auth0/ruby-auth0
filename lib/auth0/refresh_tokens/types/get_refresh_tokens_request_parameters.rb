# frozen_string_literal: true

module Auth0
  module RefreshTokens
    module Types
      class GetRefreshTokensRequestParameters < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
        field :client_id, -> { String }, optional: true, nullable: false
        field :from, -> { String }, optional: true, nullable: false
        field :take, -> { Integer }, optional: true, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class TokenExchangeProfileResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :subject_token_type, -> { String }, optional: true, nullable: false
      field :action_id, -> { String }, optional: true, nullable: false
      field :type, -> { Auth0::Types::TokenExchangeProfileTypeEnum }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end

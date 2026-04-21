# frozen_string_literal: true

module Auth0
  module Types
    class GetRefreshTokenResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :user_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { Auth0::Types::RefreshTokenDate }, optional: true, nullable: false
      field :idle_expires_at, -> { Auth0::Types::RefreshTokenDate }, optional: true, nullable: false
      field :expires_at, -> { Auth0::Types::RefreshTokenDate }, optional: true, nullable: false
      field :device, -> { Auth0::Types::RefreshTokenDevice }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
      field :session_id, -> { String }, optional: true, nullable: false
      field :rotating, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :resource_servers, -> { Internal::Types::Array[Auth0::Types::RefreshTokenResourceServer] }, optional: true, nullable: false
      field :refresh_token_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :last_exchanged_at, -> { Auth0::Types::RefreshTokenDate }, optional: true, nullable: false
    end
  end
end

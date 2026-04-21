# frozen_string_literal: true

module Auth0
  module Types
    class GetSessionResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :user_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { Auth0::Types::SessionDate }, optional: true, nullable: false
      field :updated_at, -> { Auth0::Types::SessionDate }, optional: true, nullable: false
      field :authenticated_at, -> { Auth0::Types::SessionDate }, optional: true, nullable: false
      field :idle_expires_at, -> { Auth0::Types::SessionDate }, optional: true, nullable: false
      field :expires_at, -> { Auth0::Types::SessionDate }, optional: true, nullable: false
      field :last_interacted_at, -> { Auth0::Types::SessionDate }, optional: true, nullable: false
      field :device, -> { Auth0::Types::SessionDeviceMetadata }, optional: true, nullable: false
      field :clients, -> { Internal::Types::Array[Auth0::Types::SessionClientMetadata] }, optional: true, nullable: false
      field :authentication, -> { Auth0::Types::SessionAuthenticationSignals }, optional: true, nullable: false
      field :cookie, -> { Auth0::Types::SessionCookieMetadata }, optional: true, nullable: false
      field :session_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

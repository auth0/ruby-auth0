# frozen_string_literal: true

module Auth0
  module Types
    class UserAuthenticationMethod < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :type, -> { Auth0::Types::AuthenticationMethodTypeEnum }, optional: false, nullable: false
      field :confirmed, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :authentication_methods, -> { Internal::Types::Array[Auth0::Types::UserAuthenticationMethodProperties] }, optional: true, nullable: false
      field :preferred_authentication_method, -> { Auth0::Types::PreferredAuthenticationMethodEnum }, optional: true, nullable: false
      field :link_id, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :key_id, -> { String }, optional: true, nullable: false
      field :public_key, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :enrolled_at, -> { String }, optional: true, nullable: false
      field :last_auth_at, -> { String }, optional: true, nullable: false
      field :credential_device_type, -> { String }, optional: true, nullable: false
      field :credential_backed_up, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :identity_user_id, -> { String }, optional: true, nullable: false
      field :user_agent, -> { String }, optional: true, nullable: false
      field :aaguid, -> { String }, optional: true, nullable: false
      field :relying_party_identifier, -> { String }, optional: true, nullable: false
    end
  end
end

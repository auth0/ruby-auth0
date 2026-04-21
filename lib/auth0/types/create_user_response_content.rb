# frozen_string_literal: true

module Auth0
  module Types
    class CreateUserResponseContent < Internal::Types::Model
      field :user_id, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :email_verified, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :username, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
      field :phone_verified, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :created_at, -> { Auth0::Types::UserDateSchema }, optional: true, nullable: false
      field :updated_at, -> { Auth0::Types::UserDateSchema }, optional: true, nullable: false
      field :identities, -> { Internal::Types::Array[Auth0::Types::UserIdentitySchema] }, optional: true, nullable: false
      field :app_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :user_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :picture, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :nickname, -> { String }, optional: true, nullable: false
      field :multifactor, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :last_ip, -> { String }, optional: true, nullable: false
      field :last_login, -> { Auth0::Types::UserDateSchema }, optional: true, nullable: false
      field :logins_count, -> { Integer }, optional: true, nullable: false
      field :blocked, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :given_name, -> { String }, optional: true, nullable: false
      field :family_name, -> { String }, optional: true, nullable: false
    end
  end
end

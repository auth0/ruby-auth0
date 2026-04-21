# frozen_string_literal: true

module Auth0
  module Users
    module Types
      class UpdateUserRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :blocked, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :email_verified, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :email, -> { String }, optional: true, nullable: false
        field :phone_number, -> { String }, optional: true, nullable: false
        field :phone_verified, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :user_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :app_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :given_name, -> { String }, optional: true, nullable: false
        field :family_name, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :nickname, -> { String }, optional: true, nullable: false
        field :picture, -> { String }, optional: true, nullable: false
        field :verify_email, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :verify_phone_number, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :password, -> { String }, optional: true, nullable: false
        field :connection, -> { String }, optional: true, nullable: false
        field :client_id, -> { String }, optional: true, nullable: false
        field :username, -> { String }, optional: true, nullable: false
      end
    end
  end
end

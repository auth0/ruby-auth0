# frozen_string_literal: true

module Auth0
  module Types
    class UserProfileData < Internal::Types::Model
      field :email, -> { String }, optional: true, nullable: false
      field :email_verified, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :username, -> { String }, optional: true, nullable: false
      field :given_name, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
      field :phone_verified, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :family_name, -> { String }, optional: true, nullable: false
    end
  end
end

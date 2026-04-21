# frozen_string_literal: true

module Auth0
  module Users
    module AuthenticationMethods
      module Types
        class CreateUserAuthenticationMethodRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :type, -> { Auth0::Types::CreatedUserAuthenticationMethodTypeEnum }, optional: false, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :totp_secret, -> { String }, optional: true, nullable: false
          field :phone_number, -> { String }, optional: true, nullable: false
          field :email, -> { String }, optional: true, nullable: false
          field :preferred_authentication_method, -> { Auth0::Types::PreferredAuthenticationMethodEnum }, optional: true, nullable: false
          field :key_id, -> { String }, optional: true, nullable: false
          field :public_key, -> { String }, optional: true, nullable: false
          field :relying_party_identifier, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end

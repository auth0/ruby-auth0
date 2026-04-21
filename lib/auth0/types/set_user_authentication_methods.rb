# frozen_string_literal: true

module Auth0
  module Types
    class SetUserAuthenticationMethods < Internal::Types::Model
      field :type, -> { Auth0::Types::AuthenticationTypeEnum }, optional: false, nullable: false
      field :preferred_authentication_method, -> { Auth0::Types::PreferredAuthenticationMethodEnum }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :totp_secret, -> { String }, optional: true, nullable: false
    end
  end
end

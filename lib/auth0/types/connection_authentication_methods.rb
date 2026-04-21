# frozen_string_literal: true

module Auth0
  module Types
    # Options for enabling authentication methods.
    class ConnectionAuthenticationMethods < Internal::Types::Model
      field :password, -> { Auth0::Types::ConnectionPasswordAuthenticationMethod }, optional: true, nullable: false
      field :passkey, -> { Auth0::Types::ConnectionPasskeyAuthenticationMethod }, optional: true, nullable: false
      field :email_otp, -> { Auth0::Types::ConnectionEmailOtpAuthenticationMethod }, optional: true, nullable: false
      field :phone_otp, -> { Auth0::Types::ConnectionPhoneOtpAuthenticationMethod }, optional: true, nullable: false
    end
  end
end

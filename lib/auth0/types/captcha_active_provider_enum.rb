# frozen_string_literal: true

module Auth0
  module Types
    module CaptchaActiveProviderEnum
      extend Auth0::Internal::Types::Enum

      SIMPLE_CAPTCHA = "simple_captcha"
      AUTH_CHALLENGE = "auth_challenge"
      RECAPTCHA_V2 = "recaptcha_v2"
      RECAPTCHA_ENTERPRISE = "recaptcha_enterprise"
      HCAPTCHA = "hcaptcha"
      FRIENDLY_CAPTCHA = "friendly_captcha"
      ARKOSE = "arkose"
    end
  end
end

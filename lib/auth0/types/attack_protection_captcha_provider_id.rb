# frozen_string_literal: true

module Auth0
  module Types
    module AttackProtectionCaptchaProviderID
      extend Auth0::Internal::Types::Enum

      ARKOSE = "arkose"
      AUTH_CHALLENGE = "auth_challenge"
      FRIENDLY_CAPTCHA = "friendly_captcha"
      HCAPTCHA = "hcaptcha"
      RECAPTCHA_V2 = "recaptcha_v2"
      RECAPTCHA_ENTERPRISE = "recaptcha_enterprise"
      SIMPLE_CAPTCHA = "simple_captcha"
    end
  end
end

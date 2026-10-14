# frozen_string_literal: true

module Auth0
  module Types
    # CAPTCHA configuration override for this policy.
    class AttackProtectionCaptchaPolicyActionInput < Internal::Types::Model
      field :active_provider_id, -> { Auth0::Types::CaptchaActiveProviderEnum }, optional: true, nullable: false

      field :simple_captcha, -> { Auth0::Types::CaptchaPolicyActionSimpleCaptcha }, optional: true, nullable: false

      field :auth_challenge, -> { Auth0::Types::CaptchaPolicyActionAuthChallenge }, optional: true, nullable: false

      field :recaptcha_v2, -> { Auth0::Types::CaptchaPolicyActionRecaptchaV2Input }, optional: true, nullable: false

      field :recaptcha_enterprise, -> { Auth0::Types::CaptchaPolicyActionRecaptchaEnterpriseInput }, optional: true, nullable: false

      field :hcaptcha, -> { Auth0::Types::CaptchaPolicyActionHcaptchaInput }, optional: true, nullable: false

      field :friendly_captcha, -> { Auth0::Types::CaptchaPolicyActionFriendlyCaptchaInput }, optional: true, nullable: false

      field :arkose, -> { Auth0::Types::CaptchaPolicyActionArkoseInput }, optional: true, nullable: false
    end
  end
end

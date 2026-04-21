# frozen_string_literal: true

module Auth0
  module Types
    class UpdateAttackProtectionCaptchaResponseContent < Internal::Types::Model
      field :active_provider_id, -> { String }, optional: true, nullable: false
      field :arkose, -> { Auth0::Types::AttackProtectionCaptchaArkoseResponseContent }, optional: true, nullable: false
      field :auth_challenge, -> { Auth0::Types::AttackProtectionCaptchaAuthChallengeResponseContent }, optional: true, nullable: false
      field :hcaptcha, -> { Auth0::Types::AttackProtectionCaptchaHcaptchaResponseContent }, optional: true, nullable: false
      field :friendly_captcha, -> { Auth0::Types::AttackProtectionCaptchaFriendlyCaptchaResponseContent }, optional: true, nullable: false
      field :recaptcha_enterprise, -> { Auth0::Types::AttackProtectionCaptchaRecaptchaEnterpriseResponseContent }, optional: true, nullable: false
      field :recaptcha_v2, -> { Auth0::Types::AttackProtectionCaptchaRecaptchaV2ResponseContent }, optional: true, nullable: false
      field :simple_captcha, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

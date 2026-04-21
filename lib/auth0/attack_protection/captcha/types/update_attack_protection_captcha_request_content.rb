# frozen_string_literal: true

module Auth0
  module AttackProtection
    module Captcha
      module Types
        class UpdateAttackProtectionCaptchaRequestContent < Internal::Types::Model
          field :active_provider_id, -> { Auth0::Types::AttackProtectionCaptchaProviderID }, optional: true, nullable: false
          field :arkose, -> { Auth0::Types::AttackProtectionUpdateCaptchaArkose }, optional: true, nullable: false
          field :auth_challenge, -> { Auth0::Types::AttackProtectionCaptchaAuthChallengeRequest }, optional: true, nullable: false
          field :hcaptcha, -> { Auth0::Types::AttackProtectionUpdateCaptchaHcaptcha }, optional: true, nullable: false
          field :friendly_captcha, -> { Auth0::Types::AttackProtectionUpdateCaptchaFriendlyCaptcha }, optional: true, nullable: false
          field :recaptcha_enterprise, -> { Auth0::Types::AttackProtectionUpdateCaptchaRecaptchaEnterprise }, optional: true, nullable: false
          field :recaptcha_v2, -> { Auth0::Types::AttackProtectionUpdateCaptchaRecaptchaV2 }, optional: true, nullable: false
          field :simple_captcha, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        end
      end
    end
  end
end

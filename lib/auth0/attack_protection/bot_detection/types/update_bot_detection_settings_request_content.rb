# frozen_string_literal: true

module Auth0
  module AttackProtection
    module BotDetection
      module Types
        class UpdateBotDetectionSettingsRequestContent < Internal::Types::Model
          field :bot_detection_level, -> { Auth0::Types::BotDetectionLevelEnum }, optional: true, nullable: false
          field :challenge_password_policy, -> { Auth0::Types::BotDetectionChallengePolicyPasswordFlowEnum }, optional: true, nullable: false
          field :challenge_passwordless_policy, -> { Auth0::Types::BotDetectionChallengePolicyPasswordlessFlowEnum }, optional: true, nullable: false
          field :challenge_password_reset_policy, -> { Auth0::Types::BotDetectionChallengePolicyPasswordResetFlowEnum }, optional: true, nullable: false
          field :allowlist, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :monitoring_mode_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end

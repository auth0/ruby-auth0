# frozen_string_literal: true

module Auth0
  module Types
    class GetBotDetectionSettingsResponseContent < Internal::Types::Model
      field :bot_detection_level, -> { Auth0::Types::BotDetectionLevelEnum }, optional: false, nullable: false
      field :challenge_password_policy, -> { Auth0::Types::BotDetectionChallengePolicyPasswordFlowEnum }, optional: false, nullable: false
      field :challenge_passwordless_policy, -> { Auth0::Types::BotDetectionChallengePolicyPasswordlessFlowEnum }, optional: false, nullable: false
      field :challenge_password_reset_policy, -> { Auth0::Types::BotDetectionChallengePolicyPasswordResetFlowEnum }, optional: false, nullable: false
      field :allowlist, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :monitoring_mode_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end

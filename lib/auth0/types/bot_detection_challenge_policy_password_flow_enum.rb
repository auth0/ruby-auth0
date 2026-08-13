# frozen_string_literal: true

module Auth0
  module Types
    module BotDetectionChallengePolicyPasswordFlowEnum
      extend Auth0::Internal::Types::Enum

      NEVER = "never"
      WHEN_RISKY = "when_risky"
      ALWAYS = "always"
    end
  end
end

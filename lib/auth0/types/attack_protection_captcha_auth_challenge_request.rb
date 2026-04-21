# frozen_string_literal: true

module Auth0
  module Types
    class AttackProtectionCaptchaAuthChallengeRequest < Internal::Types::Model
      field :fail_open, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class AttackProtectionCaptchaAuthChallengeResponseContent < Internal::Types::Model
      field :fail_open, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Auth Challenge CAPTCHA provider configuration.
    class CaptchaPolicyActionAuthChallenge < Internal::Types::Model
      field :fail_open, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Friendly Captcha provider configuration.
    class CaptchaPolicyActionFriendlyCaptchaInput < Internal::Types::Model
      field :site_key, -> { String }, optional: true, nullable: false

      field :secret, -> { String }, optional: true, nullable: false
    end
  end
end

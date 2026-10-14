# frozen_string_literal: true

module Auth0
  module Types
    # Friendly Captcha provider configuration.
    class CaptchaPolicyActionFriendlyCaptcha < Internal::Types::Model
      field :site_key, -> { String }, optional: true, nullable: false
    end
  end
end

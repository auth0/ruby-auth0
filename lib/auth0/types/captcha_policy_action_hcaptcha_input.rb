# frozen_string_literal: true

module Auth0
  module Types
    # hCaptcha provider configuration.
    class CaptchaPolicyActionHcaptchaInput < Internal::Types::Model
      field :site_key, -> { String }, optional: true, nullable: false

      field :secret, -> { String }, optional: true, nullable: false
    end
  end
end

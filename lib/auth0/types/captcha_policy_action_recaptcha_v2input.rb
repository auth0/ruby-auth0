# frozen_string_literal: true

module Auth0
  module Types
    # reCAPTCHA v2 provider configuration.
    class CaptchaPolicyActionRecaptchaV2Input < Internal::Types::Model
      field :site_key, -> { String }, optional: true, nullable: false

      field :secret, -> { String }, optional: true, nullable: false
    end
  end
end

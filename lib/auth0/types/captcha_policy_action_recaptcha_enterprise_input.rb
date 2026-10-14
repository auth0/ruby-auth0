# frozen_string_literal: true

module Auth0
  module Types
    # reCAPTCHA Enterprise provider configuration.
    class CaptchaPolicyActionRecaptchaEnterpriseInput < Internal::Types::Model
      field :site_key, -> { String }, optional: true, nullable: false

      field :project_id, -> { String }, optional: true, nullable: false

      field :api_key, -> { String }, optional: true, nullable: false
    end
  end
end

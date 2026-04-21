# frozen_string_literal: true

module Auth0
  module Types
    class AttackProtectionCaptchaHcaptchaResponseContent < Internal::Types::Model
      field :site_key, -> { String }, optional: true, nullable: false
    end
  end
end

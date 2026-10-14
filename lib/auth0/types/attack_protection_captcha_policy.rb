# frozen_string_literal: true

module Auth0
  module Types
    # An attack protection policy override for CAPTCHA.
    class AttackProtectionCaptchaPolicy < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :priority, -> { Integer }, optional: false, nullable: false

      field :match, -> { Auth0::Types::AttackProtectionCaptchaPolicyMatch }, optional: false, nullable: false

      field :action, -> { Auth0::Types::AttackProtectionCaptchaPolicyAction }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module AttackProtection
    module CaptchaPolicies
      module Types
        class CreateAttackProtectionCaptchaPolicyRequestContent < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :priority, -> { Integer }, optional: false, nullable: false

          field :match, -> { Auth0::Types::AttackProtectionCaptchaPolicyMatch }, optional: false, nullable: false

          field :action, -> { Auth0::Types::AttackProtectionCaptchaPolicyActionInput }, optional: false, nullable: false
        end
      end
    end
  end
end

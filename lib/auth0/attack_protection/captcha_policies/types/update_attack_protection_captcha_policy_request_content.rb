# frozen_string_literal: true

module Auth0
  module AttackProtection
    module CaptchaPolicies
      module Types
        class UpdateAttackProtectionCaptchaPolicyRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :name, -> { String }, optional: true, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :priority, -> { Integer }, optional: true, nullable: false

          field :match, -> { Auth0::Types::AttackProtectionCaptchaPolicyMatch }, optional: true, nullable: false

          field :action, -> { Auth0::Types::AttackProtectionCaptchaPolicyActionInput }, optional: true, nullable: false
        end
      end
    end
  end
end

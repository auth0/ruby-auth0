# frozen_string_literal: true

module Auth0
  module AttackProtection
    module BruteForceProtection
      module Types
        class UpdateBruteForceSettingsRequestContent < Internal::Types::Model
          field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :shields, -> { Internal::Types::Array[Auth0::Types::BruteForceProtectionShieldsEnum] }, optional: true, nullable: false
          field :allowlist, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :mode, -> { Auth0::Types::BruteForceProtectionModeEnum }, optional: true, nullable: false
          field :max_attempts, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end

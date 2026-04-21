# frozen_string_literal: true

module Auth0
  module Types
    class UpdateSuspiciousIPThrottlingSettingsResponseContent < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :shields, -> { Internal::Types::Array[Auth0::Types::SuspiciousIPThrottlingShieldsEnum] }, optional: true, nullable: false
      field :allowlist, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :stage, -> { Auth0::Types::SuspiciousIPThrottlingStage }, optional: true, nullable: false
    end
  end
end

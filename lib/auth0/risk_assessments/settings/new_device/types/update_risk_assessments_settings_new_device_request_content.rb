# frozen_string_literal: true

module Auth0
  module RiskAssessments
    module Settings
      module NewDevice
        module Types
          class UpdateRiskAssessmentsSettingsNewDeviceRequestContent < Internal::Types::Model
            field :remember_for, -> { Integer }, optional: false, nullable: false
          end
        end
      end
    end
  end
end

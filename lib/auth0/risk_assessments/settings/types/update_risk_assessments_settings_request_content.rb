# frozen_string_literal: true

module Auth0
  module RiskAssessments
    module Settings
      module Types
        class UpdateRiskAssessmentsSettingsRequestContent < Internal::Types::Model
          field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end

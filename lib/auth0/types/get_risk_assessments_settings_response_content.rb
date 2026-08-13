# frozen_string_literal: true

module Auth0
  module Types
    class GetRiskAssessmentsSettingsResponseContent < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end

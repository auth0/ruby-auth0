# frozen_string_literal: true

module Auth0
  module Types
    class UpdateRiskAssessmentsSettingsNewDeviceResponseContent < Internal::Types::Model
      field :remember_for, -> { Integer }, optional: false, nullable: false
    end
  end
end

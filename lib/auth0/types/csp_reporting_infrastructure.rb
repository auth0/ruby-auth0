# frozen_string_literal: true

module Auth0
  module Types
    # Global reporting infrastructure configuration.
    class CspReportingInfrastructure < Internal::Types::Model
      field :report_to, -> { Auth0::Types::CspReportTo }, optional: true, nullable: false

      field :reporting_endpoints, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end

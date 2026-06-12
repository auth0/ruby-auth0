# frozen_string_literal: true

module Auth0
  module Types
    # Content Security Policy configuration with multi-policy support.
    class ContentSecurityPolicyConfig < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :policies, -> { Internal::Types::Array[Auth0::Types::CspPolicy] }, optional: true, nullable: false

      field :reporting_infrastructure, -> { Auth0::Types::CspReportingInfrastructure }, optional: true, nullable: false
    end
  end
end

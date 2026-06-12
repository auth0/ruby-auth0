# frozen_string_literal: true

module Auth0
  module Types
    # A single CSP policy with mode, directives, flags, and optional reporting.
    class CspPolicy < Internal::Types::Model
      field :mode, -> { Auth0::Types::CspPolicyMode }, optional: true, nullable: false

      field :directives, -> { Internal::Types::Hash[String, Internal::Types::Array[String]] }, optional: true, nullable: false

      field :flags, -> { Internal::Types::Array[Auth0::Types::CspFlag] }, optional: true, nullable: false

      field :reporting, -> { Auth0::Types::CspPolicyReporting }, optional: true, nullable: false
    end
  end
end

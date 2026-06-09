# frozen_string_literal: true

module Auth0
  module Types
    # Per-policy reporting configuration.
    class CspPolicyReporting < Internal::Types::Model
      field :report_uri, -> { String }, optional: true, nullable: false

      field :report_to_group, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Report-To header configuration.
    class CspReportTo < Internal::Types::Model
      field :group, -> { String }, optional: true, nullable: false

      field :max_age, -> { Integer }, optional: true, nullable: false

      field :endpoints, -> { Internal::Types::Array[Auth0::Types::CspReportToEndpoint] }, optional: true, nullable: false
    end
  end
end

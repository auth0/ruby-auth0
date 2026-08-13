# frozen_string_literal: true

module Auth0
  module Types
    class GetSupplementalSignalsResponseContent < Internal::Types::Model
      field :akamai_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

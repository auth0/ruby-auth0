# frozen_string_literal: true

module Auth0
  module SupplementalSignals
    module Types
      class UpdateSupplementalSignalsRequestContent < Internal::Types::Model
        field :akamai_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class GetGuardianFactorsProviderApnsResponseContent < Internal::Types::Model
      field :bundle_id, -> { String }, optional: true, nullable: false
      field :sandbox, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

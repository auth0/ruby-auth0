# frozen_string_literal: true

module Auth0
  module Types
    class SetGuardianFactorPhoneMessageTypesResponseContent < Internal::Types::Model
      field :message_types, -> { Internal::Types::Array[Auth0::Types::GuardianFactorPhoneFactorMessageTypeEnum] }, optional: true, nullable: false
    end
  end
end

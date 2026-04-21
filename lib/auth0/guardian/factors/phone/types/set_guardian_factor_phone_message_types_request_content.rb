# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Phone
        module Types
          class SetGuardianFactorPhoneMessageTypesRequestContent < Internal::Types::Model
            field :message_types, -> { Internal::Types::Array[Auth0::Types::GuardianFactorPhoneFactorMessageTypeEnum] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end

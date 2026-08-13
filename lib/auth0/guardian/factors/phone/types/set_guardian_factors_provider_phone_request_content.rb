# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Phone
        module Types
          class SetGuardianFactorsProviderPhoneRequestContent < Internal::Types::Model
            field :provider, -> { Auth0::Types::GuardianFactorsProviderSmsProviderEnum }, optional: false, nullable: false
          end
        end
      end
    end
  end
end

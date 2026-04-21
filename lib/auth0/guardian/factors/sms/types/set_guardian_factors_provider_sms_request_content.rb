# frozen_string_literal: true

module Auth0
  module Guardian
    module Factors
      module Sms
        module Types
          class SetGuardianFactorsProviderSmsRequestContent < Internal::Types::Model
            field :provider, -> { Auth0::Types::GuardianFactorsProviderSmsProviderEnum }, optional: false, nullable: false
          end
        end
      end
    end
  end
end

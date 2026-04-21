# frozen_string_literal: true

module Auth0
  module Types
    class GetGuardianFactorsProviderSmsResponseContent < Internal::Types::Model
      field :provider, -> { Auth0::Types::GuardianFactorsProviderSmsProviderEnum }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module AttackProtection
    module PhoneProviderProtection
      module Types
        class PatchPhoneProviderProtectionRequestContent < Internal::Types::Model
          field :type, -> { Auth0::Types::PhoneProviderProtectionBackoffStrategyEnum }, optional: false, nullable: false
        end
      end
    end
  end
end

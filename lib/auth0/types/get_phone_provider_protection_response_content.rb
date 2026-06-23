# frozen_string_literal: true

module Auth0
  module Types
    class GetPhoneProviderProtectionResponseContent < Internal::Types::Model
      field :type, -> { Auth0::Types::PhoneProviderProtectionBackoffStrategyEnum }, optional: false, nullable: false
    end
  end
end

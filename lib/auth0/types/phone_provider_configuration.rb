# frozen_string_literal: true

module Auth0
  module Types
    class PhoneProviderConfiguration < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::TwilioProviderConfiguration }
      member -> { Auth0::Types::CustomProviderConfiguration }
    end
  end
end

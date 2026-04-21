# frozen_string_literal: true

module Auth0
  module Types
    # Provider credentials required to use authenticate to the provider.
    class PhoneProviderCredentials < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::TwilioProviderCredentials }
      member -> { Auth0::Types::CustomProviderCredentials }
    end
  end
end

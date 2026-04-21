# frozen_string_literal: true

module Auth0
  module Types
    module ClientTokenExchangeTypeEnum
      extend Auth0::Internal::Types::Enum

      CUSTOM_AUTHENTICATION = "custom_authentication"
      ON_BEHALF_OF_TOKEN_EXCHANGE = "on_behalf_of_token_exchange"
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    module CustomDomainCustomClientIPHeaderEnum
      extend Auth0::Internal::Types::Enum

      TRUE_CLIENT_IP = "true-client-ip"
      CF_CONNECTING_IP = "cf-connecting-ip"
      X_FORWARDED_FOR = "x-forwarded-for"
      X_AZURE_CLIENTIP = "x-azure-clientip"
      EMPTY = ""
    end
  end
end

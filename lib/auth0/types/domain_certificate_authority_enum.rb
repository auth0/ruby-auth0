# frozen_string_literal: true

module Auth0
  module Types
    module DomainCertificateAuthorityEnum
      extend Auth0::Internal::Types::Enum

      LETSENCRYPT = "letsencrypt"
      GOOGLETRUST = "googletrust"
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class UpdateTokenQuota < Internal::Types::Model
      field :client_credentials, -> { Auth0::Types::TokenQuotaClientCredentials }, optional: false, nullable: false
    end
  end
end

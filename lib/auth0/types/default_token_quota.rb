# frozen_string_literal: true

module Auth0
  module Types
    # Token Quota configuration, to configure quotas for token issuance for clients and organizations. Applied to all
    # clients and organizations unless overridden in individual client or organization settings.
    class DefaultTokenQuota < Internal::Types::Model
      field :clients, -> { Auth0::Types::TokenQuotaConfiguration }, optional: true, nullable: false
      field :organizations, -> { Auth0::Types::TokenQuotaConfiguration }, optional: true, nullable: false
    end
  end
end

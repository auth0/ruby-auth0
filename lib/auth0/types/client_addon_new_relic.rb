# frozen_string_literal: true

module Auth0
  module Types
    # New Relic SSO configuration.
    class ClientAddonNewRelic < Internal::Types::Model
      field :account, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'salesforce-community' connection
    class ConnectionOptionsSalesforceCommunity < Internal::Types::Model
      field :community_base_url, -> { String }, optional: true, nullable: false
    end
  end
end

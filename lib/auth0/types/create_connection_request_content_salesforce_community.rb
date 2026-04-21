# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=salesforce-community
    class CreateConnectionRequestContentSalesforceCommunity < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentSalesforceCommunityStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsSalesforceCommunity }, optional: true, nullable: false
    end
  end
end

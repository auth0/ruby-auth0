# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=shopify
    class CreateConnectionRequestContentShopify < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentShopifyStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsShopify }, optional: true, nullable: false
    end
  end
end

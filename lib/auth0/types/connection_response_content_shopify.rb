# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=shopify
    class ConnectionResponseContentShopify < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentShopifyStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsShopify }, optional: true, nullable: false
    end
  end
end

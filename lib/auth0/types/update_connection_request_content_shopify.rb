# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=shopify
    class UpdateConnectionRequestContentShopify < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsShopify }, optional: true, nullable: false
    end
  end
end

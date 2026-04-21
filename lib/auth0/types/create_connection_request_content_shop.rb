# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=shop
    class CreateConnectionRequestContentShop < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentShopStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsShop }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=shop
    class UpdateConnectionRequestContentShop < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsShop }, optional: true, nullable: false
    end
  end
end

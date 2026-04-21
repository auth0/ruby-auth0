# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=amazon
    class CreateConnectionRequestContentAmazon < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentAmazonStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAmazon }, optional: true, nullable: false
    end
  end
end

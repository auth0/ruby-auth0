# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=amazon
    class UpdateConnectionRequestContentAmazon < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsAmazon }, optional: true, nullable: false
    end
  end
end

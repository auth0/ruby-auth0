# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=dwolla
    class UpdateConnectionRequestContentDwolla < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsDwolla }, optional: true, nullable: false
    end
  end
end

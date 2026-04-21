# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=dwolla
    class CreateConnectionRequestContentDwolla < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentDwollaStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsDwolla }, optional: true, nullable: false
    end
  end
end

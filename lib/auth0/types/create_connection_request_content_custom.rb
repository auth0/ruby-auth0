# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=custom
    class CreateConnectionRequestContentCustom < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentCustomStrategy }, optional: false, nullable: false
      field :options, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

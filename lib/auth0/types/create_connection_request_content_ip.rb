# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=ip
    class CreateConnectionRequestContentIP < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentIPStrategy }, optional: false, nullable: false
      field :options, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

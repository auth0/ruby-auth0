# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=ip
    class UpdateConnectionRequestContentIP < Internal::Types::Model
      field :options, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=sharepoint
    class UpdateConnectionRequestContentSharepoint < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsSharepoint }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

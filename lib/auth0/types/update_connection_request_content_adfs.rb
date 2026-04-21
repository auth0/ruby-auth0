# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=adfs
    class UpdateConnectionRequestContentAdfs < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsAdfs }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

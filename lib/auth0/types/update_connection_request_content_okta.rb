# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=okta
    class UpdateConnectionRequestContentOkta < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsOkta }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

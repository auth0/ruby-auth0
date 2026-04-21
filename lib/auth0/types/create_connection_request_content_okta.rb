# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=okta
    class CreateConnectionRequestContentOkta < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentOktaStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsOkta }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

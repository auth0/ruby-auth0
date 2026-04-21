# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=waad
    class CreateConnectionRequestContentAzureAd < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentAzureAdStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAzureAd }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

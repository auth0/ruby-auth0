# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=google-apps
    class CreateConnectionRequestContentGoogleApps < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentGoogleAppsStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsGoogleApps }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

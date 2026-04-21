# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=google-apps
    class ConnectionResponseContentGoogleApps < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentGoogleAppsStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsGoogleApps }, optional: true, nullable: false
      field :provisioning_ticket_url, -> { String }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

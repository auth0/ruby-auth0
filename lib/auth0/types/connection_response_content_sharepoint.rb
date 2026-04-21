# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=sharepoint
    class ConnectionResponseContentSharepoint < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentSharepointStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsSharepoint }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

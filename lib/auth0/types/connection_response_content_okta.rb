# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=okta
    class ConnectionResponseContentOkta < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentOktaStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsOkta }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

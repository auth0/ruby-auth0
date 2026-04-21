# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=ip
    class ConnectionResponseContentIP < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentIPStrategy }, optional: false, nullable: false
      field :options, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

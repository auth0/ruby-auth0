# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=custom
    class ConnectionResponseContentCustom < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentCustomStrategy }, optional: false, nullable: false
      field :options, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :provisioning_ticket_url, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=ad
    class ConnectionResponseContentAd < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentAdStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAd }, optional: true, nullable: false
      field :provisioning_ticket_url, -> { String }, optional: true, nullable: false
    end
  end
end

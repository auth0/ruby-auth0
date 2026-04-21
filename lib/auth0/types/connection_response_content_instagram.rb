# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=instagram
    class ConnectionResponseContentInstagram < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentInstagramStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsInstagram }, optional: true, nullable: false
    end
  end
end

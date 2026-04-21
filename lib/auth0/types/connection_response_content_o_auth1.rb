# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=oauth1
    class ConnectionResponseContentOAuth1 < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentOAuth1Strategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsOAuth1 }, optional: true, nullable: false
    end
  end
end

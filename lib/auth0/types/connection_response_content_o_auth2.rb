# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=oauth2
    class ConnectionResponseContentOAuth2 < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentOAuth2Strategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsOAuth2 }, optional: true, nullable: false
    end
  end
end

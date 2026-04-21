# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=google-oauth2
    class ConnectionResponseContentGoogleOAuth2 < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentGoogleOAuth2Strategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsGoogleOAuth2 }, optional: true, nullable: false
    end
  end
end

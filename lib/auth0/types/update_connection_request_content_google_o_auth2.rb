# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=google-oauth2
    class UpdateConnectionRequestContentGoogleOAuth2 < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsGoogleOAuth2 }, optional: true, nullable: false
    end
  end
end

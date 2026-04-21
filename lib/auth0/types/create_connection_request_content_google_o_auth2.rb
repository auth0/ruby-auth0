# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=google-oauth2
    class CreateConnectionRequestContentGoogleOAuth2 < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentGoogleOAuth2Strategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsGoogleOAuth2 }, optional: true, nullable: false
    end
  end
end

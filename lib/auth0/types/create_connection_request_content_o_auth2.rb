# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=oauth2
    class CreateConnectionRequestContentOAuth2 < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentOAuth2Strategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsOAuth2 }, optional: true, nullable: false
    end
  end
end

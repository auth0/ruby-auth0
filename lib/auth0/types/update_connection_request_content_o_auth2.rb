# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=oauth2
    class UpdateConnectionRequestContentOAuth2 < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsOAuth2 }, optional: true, nullable: false
    end
  end
end

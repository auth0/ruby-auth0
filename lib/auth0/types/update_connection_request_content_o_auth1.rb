# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=oauth1
    class UpdateConnectionRequestContentOAuth1 < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsOAuth1 }, optional: true, nullable: false
    end
  end
end

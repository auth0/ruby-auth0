# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=ad
    class UpdateConnectionRequestContentAd < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsAd }, optional: true, nullable: false
    end
  end
end

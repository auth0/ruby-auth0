# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=ad
    class CreateConnectionRequestContentAd < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentAdStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAd }, optional: true, nullable: false
    end
  end
end

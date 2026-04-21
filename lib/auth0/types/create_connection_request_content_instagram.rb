# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=instagram
    class CreateConnectionRequestContentInstagram < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentInstagramStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsInstagram }, optional: true, nullable: false
    end
  end
end

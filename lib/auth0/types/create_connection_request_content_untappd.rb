# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=untappd
    class CreateConnectionRequestContentUntappd < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentUntappdStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsUntappd }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=yahoo
    class CreateConnectionRequestContentYahoo < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentYahooStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsYahoo }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=yahoo
    class ConnectionResponseContentYahoo < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentYahooStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsYahoo }, optional: true, nullable: false
    end
  end
end

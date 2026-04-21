# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=exact
    class ConnectionResponseContentExact < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentExactStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsExact }, optional: true, nullable: false
    end
  end
end

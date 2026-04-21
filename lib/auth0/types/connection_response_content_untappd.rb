# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=untappd
    class ConnectionResponseContentUntappd < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentUntappdStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsUntappd }, optional: true, nullable: false
    end
  end
end

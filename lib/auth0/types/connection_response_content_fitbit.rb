# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=fitbit
    class ConnectionResponseContentFitbit < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentFitbitStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsFitbit }, optional: true, nullable: false
    end
  end
end

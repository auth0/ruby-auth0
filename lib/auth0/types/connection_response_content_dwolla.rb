# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=dwolla
    class ConnectionResponseContentDwolla < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentDwollaStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsDwolla }, optional: true, nullable: false
    end
  end
end

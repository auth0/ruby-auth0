# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=bitly
    class ConnectionResponseContentBitly < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentBitlyStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsBitly }, optional: true, nullable: false
    end
  end
end

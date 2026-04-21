# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=amazon
    class ConnectionResponseContentAmazon < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentAmazonStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAmazon }, optional: true, nullable: false
    end
  end
end

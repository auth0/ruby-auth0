# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=wordpress
    class ConnectionResponseContentWordpress < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentWordpressStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsWordpress }, optional: true, nullable: false
    end
  end
end

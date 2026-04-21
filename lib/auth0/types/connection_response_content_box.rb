# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=box
    class ConnectionResponseContentBox < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentBoxStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsBox }, optional: true, nullable: false
    end
  end
end

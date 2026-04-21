# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionUpstreamAlias < Internal::Types::Model
      field :alias_, -> { Auth0::Types::ConnectionUpstreamAliasEnum }, optional: true, nullable: false, api_name: "alias"
    end
  end
end

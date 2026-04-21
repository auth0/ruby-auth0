# frozen_string_literal: true

module Auth0
  module Types
    class ListNetworkACLsOffsetPaginatedResponseContent < Internal::Types::Model
      field :network_acls, -> { Internal::Types::Array[Auth0::Types::NetworkACLsResponseContent] }, optional: true, nullable: false
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
    end
  end
end

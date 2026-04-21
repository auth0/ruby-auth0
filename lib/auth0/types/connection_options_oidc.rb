# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'oidc' connection
    class ConnectionOptionsOidc < Internal::Types::Model
      field :attribute_map, -> { Auth0::Types::ConnectionAttributeMapOidc }, optional: true, nullable: false
      field :discovery_url, -> { String }, optional: true, nullable: false
      field :type, -> { Auth0::Types::ConnectionTypeEnumOidc }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'okta' connection
    class ConnectionOptionsOkta < Internal::Types::Model
      field :attribute_map, -> { Auth0::Types::ConnectionAttributeMapOkta }, optional: true, nullable: false
      field :domain, -> { String }, optional: true, nullable: false
      field :type, -> { Auth0::Types::ConnectionTypeEnumOkta }, optional: true, nullable: false
    end
  end
end

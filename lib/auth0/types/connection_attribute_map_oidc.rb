# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for mapping claims from the identity provider to Auth0 user profile attributes. Allows customizing
    # which IdP claims populate user fields and how they are transformed.
    class ConnectionAttributeMapOidc < Internal::Types::Model
      field :attributes, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :mapping_mode, -> { Auth0::Types::ConnectionMappingModeEnumOidc }, optional: true, nullable: false
      field :userinfo_scope, -> { String }, optional: true, nullable: false
    end
  end
end

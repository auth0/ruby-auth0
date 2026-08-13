# frozen_string_literal: true

module Auth0
  module Types
    # Common attributes for connection options including non-persistent attributes and Cross App Access
    class ConnectionOptionsCommon < Internal::Types::Model
      field :non_persistent_attrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end

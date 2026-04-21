# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionFieldsMapSAMLValue < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Array[String] }
    end
  end
end

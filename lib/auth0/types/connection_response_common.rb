# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionResponseCommon < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :realms, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end

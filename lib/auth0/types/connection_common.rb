# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionCommon < Internal::Types::Model
      field :display_name, -> { String }, optional: true, nullable: false
      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end

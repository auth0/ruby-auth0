# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=oauth1
    class UpdateConnectionRequestContentOAuth1 < Internal::Types::Model
      field :display_name, -> { String }, optional: true, nullable: false

      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :options, -> { Auth0::Types::ConnectionOptionsOAuth1 }, optional: true, nullable: false
    end
  end
end

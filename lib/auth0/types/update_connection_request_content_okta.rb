# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=okta
    class UpdateConnectionRequestContentOkta < Internal::Types::Model
      field :display_name, -> { String }, optional: true, nullable: false

      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :cross_app_access_requesting_app, -> { Auth0::Types::CrossAppAccessRequestingApp }, optional: true, nullable: false

      field :options, -> { Auth0::Types::ConnectionOptionsOkta }, optional: true, nullable: false

      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

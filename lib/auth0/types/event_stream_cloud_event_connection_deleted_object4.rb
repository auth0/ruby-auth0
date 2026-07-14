# frozen_string_literal: true

module Auth0
  module Types
    class EventStreamCloudEventConnectionDeletedObject4 < Internal::Types::Model
      field :authentication, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject4Authentication }, optional: true, nullable: false

      field :connected_accounts, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject4ConnectedAccounts }, optional: true, nullable: false

      field :display_name, -> { String }, optional: true, nullable: false

      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject4Metadata }, optional: true, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :realms, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :options, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject4Options }, optional: true, nullable: false

      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :strategy, -> { Auth0::Types::EventStreamCloudEventConnectionDeletedObject4StrategyEnum }, optional: false, nullable: false
    end
  end
end

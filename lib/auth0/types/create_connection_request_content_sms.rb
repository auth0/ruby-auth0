# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=sms
    class CreateConnectionRequestContentSms < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :enabled_clients, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :display_name, -> { String }, optional: true, nullable: false

      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentSmsStrategy }, optional: false, nullable: false

      field :options, -> { Auth0::Types::ConnectionOptionsSms }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # If provided, this will create a new connection for the SSO flow with the given configuration
    class SelfServiceProfileSSOTicketConnectionConfig < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :display_name, -> { String }, optional: true, nullable: false
      field :is_domain_connection, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :options, -> { Auth0::Types::SelfServiceProfileSSOTicketConnectionOptions }, optional: true, nullable: false
    end
  end
end

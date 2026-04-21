# frozen_string_literal: true

module Auth0
  module Organizations
    module EnabledConnections
      module Types
        class UpdateOrganizationConnectionRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :connection_id, -> { String }, optional: false, nullable: false, api_name: "connectionId"
          field :assign_membership_on_login, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :is_signup_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end

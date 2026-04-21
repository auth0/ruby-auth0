# frozen_string_literal: true

module Auth0
  module Types
    # Connection to be added to the organization.
    class ConnectionForOrganization < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :assign_membership_on_login, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :is_signup_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

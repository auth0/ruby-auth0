# frozen_string_literal: true

module Auth0
  module Types
    class OrganizationEnabledConnection < Internal::Types::Model
      field :connection_id, -> { String }, optional: true, nullable: false
      field :assign_membership_on_login, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :is_signup_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :connection, -> { Auth0::Types::OrganizationConnectionInformation }, optional: true, nullable: false
    end
  end
end

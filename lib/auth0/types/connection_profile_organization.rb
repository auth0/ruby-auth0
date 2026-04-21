# frozen_string_literal: true

module Auth0
  module Types
    # The organization of the connection profile.
    class ConnectionProfileOrganization < Internal::Types::Model
      field :show_as_button, -> { Auth0::Types::ConnectionProfileOrganizationShowAsButtonEnum }, optional: true, nullable: false
      field :assign_membership_on_login, -> { Auth0::Types::ConnectionProfileOrganizationAssignMembershipOnLoginEnum }, optional: true, nullable: false
    end
  end
end

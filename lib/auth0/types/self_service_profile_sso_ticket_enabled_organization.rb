# frozen_string_literal: true

module Auth0
  module Types
    class SelfServiceProfileSSOTicketEnabledOrganization < Internal::Types::Model
      field :organization_id, -> { String }, optional: false, nullable: false
      field :assign_membership_on_login, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

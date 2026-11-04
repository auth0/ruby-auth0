# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0MyOrganizationMemberManagement < Internal::Types::Model
      field :config, -> { Auth0::Types::PageComponentAuth0MyOrganizationMemberManagementConfig }, optional: true, nullable: false
    end
  end
end

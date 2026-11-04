# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0MyOrganizationDetailsEdit < Internal::Types::Model
      field :config, -> { Auth0::Types::PageComponentAuth0MyOrganizationDetailsEditConfig }, optional: true, nullable: false
    end
  end
end

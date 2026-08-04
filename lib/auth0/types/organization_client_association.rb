# frozen_string_literal: true

module Auth0
  module Types
    # The organization's association with the client passed in the <code>include_client_association_for</code> query
    # parameter.
    class OrganizationClientAssociation < Internal::Types::Model
      field :use_for_member_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

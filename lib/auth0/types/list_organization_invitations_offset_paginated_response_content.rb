# frozen_string_literal: true

module Auth0
  module Types
    class ListOrganizationInvitationsOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :invitations, -> { Internal::Types::Array[Auth0::Types::OrganizationInvitation] }, optional: true, nullable: false
    end
  end
end

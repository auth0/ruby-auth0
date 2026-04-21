# frozen_string_literal: true

module Auth0
  module Types
    class OrganizationInvitationInvitee < Internal::Types::Model
      field :email, -> { String }, optional: false, nullable: false
    end
  end
end

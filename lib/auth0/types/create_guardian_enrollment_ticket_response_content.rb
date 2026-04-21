# frozen_string_literal: true

module Auth0
  module Types
    class CreateGuardianEnrollmentTicketResponseContent < Internal::Types::Model
      field :ticket_id, -> { String }, optional: true, nullable: false
      field :ticket_url, -> { String }, optional: true, nullable: false
    end
  end
end

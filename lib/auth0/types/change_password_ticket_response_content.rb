# frozen_string_literal: true

module Auth0
  module Types
    class ChangePasswordTicketResponseContent < Internal::Types::Model
      field :ticket, -> { String }, optional: false, nullable: false
    end
  end
end

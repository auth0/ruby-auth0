# frozen_string_literal: true

module Auth0
  module Types
    class CreateSelfServiceProfileSSOTicketResponseContent < Internal::Types::Model
      field :ticket, -> { String }, optional: true, nullable: false
    end
  end
end

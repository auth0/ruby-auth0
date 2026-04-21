# frozen_string_literal: true

module Auth0
  module Types
    class AculOrganizationFilterByID < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end

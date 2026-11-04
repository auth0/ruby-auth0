# frozen_string_literal: true

module Auth0
  module Types
    class ListPortalsResponseContent < Internal::Types::Model
      field :portals, -> { Internal::Types::Array[Auth0::Types::PortalSummary] }, optional: false, nullable: false
    end
  end
end

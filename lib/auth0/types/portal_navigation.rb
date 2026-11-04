# frozen_string_literal: true

module Auth0
  module Types
    class PortalNavigation < Internal::Types::Model
      field :sidebar, -> { Auth0::Types::Sidebar }, optional: true, nullable: false
    end
  end
end

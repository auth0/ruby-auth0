# frozen_string_literal: true

module Auth0
  module Types
    class Sidebar < Internal::Types::Model
      field :components, -> { Internal::Types::Array[Auth0::Types::SidebarComponent] }, optional: true, nullable: false
    end
  end
end

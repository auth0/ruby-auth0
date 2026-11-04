# frozen_string_literal: true

module Auth0
  module Types
    class SidebarComponentAuth0InternalLinkConfig < Internal::Types::Model
      field :label, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :icon, -> { String }, optional: true, nullable: false
    end
  end
end

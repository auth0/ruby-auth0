# frozen_string_literal: true

module Auth0
  module Types
    class SidebarComponentAuth0InternalLinkV2Config < Internal::Types::Model
      field :label, -> { String }, optional: false, nullable: false

      field :page_slug, -> { String }, optional: false, nullable: false

      field :icon, -> { String }, optional: true, nullable: false
    end
  end
end

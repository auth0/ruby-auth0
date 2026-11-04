# frozen_string_literal: true

module Auth0
  module Types
    class SidebarComponentAuth0InternalLinkV2 < Internal::Types::Model
      field :config, -> { Auth0::Types::SidebarComponentAuth0InternalLinkV2Config }, optional: false, nullable: false
    end
  end
end

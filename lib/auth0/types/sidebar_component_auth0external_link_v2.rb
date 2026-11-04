# frozen_string_literal: true

module Auth0
  module Types
    class SidebarComponentAuth0ExternalLinkV2 < Internal::Types::Model
      field :config, -> { Auth0::Types::SidebarComponentAuth0ExternalLinkV2Config }, optional: false, nullable: false
    end
  end
end

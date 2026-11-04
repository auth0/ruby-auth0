# frozen_string_literal: true

module Auth0
  module Types
    # Deprecated. Use "sidebar:component:auth0:internal_link:v2" instead.
    class SidebarComponentAuth0InternalLink < Internal::Types::Model
      field :config, -> { Auth0::Types::SidebarComponentAuth0InternalLinkConfig }, optional: false, nullable: false
    end
  end
end

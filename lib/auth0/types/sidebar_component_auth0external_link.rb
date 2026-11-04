# frozen_string_literal: true

module Auth0
  module Types
    # Deprecated. Use "sidebar:component:auth0:external_link:v2" instead.
    class SidebarComponentAuth0ExternalLink < Internal::Types::Model
      field :config, -> { Auth0::Types::SidebarComponentAuth0ExternalLinkConfig }, optional: false, nullable: false
    end
  end
end

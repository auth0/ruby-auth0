# frozen_string_literal: true

module Auth0
  module Types
    class SidebarComponent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      discriminant :type

      member -> { Auth0::Types::SidebarComponentAuth0ExternalLink }, key: "SIDEBAR_COMPONENT_AUTH0EXTERNAL_LINK"

      member -> { Auth0::Types::SidebarComponentAuth0InternalLink }, key: "SIDEBAR_COMPONENT_AUTH0INTERNAL_LINK"

      member -> { Auth0::Types::SidebarComponentAuth0ExternalLinkV2 }, key: "SIDEBAR_COMPONENT_AUTH0EXTERNAL_LINK_V2"

      member -> { Auth0::Types::SidebarComponentAuth0InternalLinkV2 }, key: "SIDEBAR_COMPONENT_AUTH0INTERNAL_LINK_V2"
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Portals
    module Types
      class CreatePortalRequestContent < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :client, -> { Auth0::Types::PortalClientSecretPostRequest }, optional: false, nullable: false

        field :navigation, -> { Auth0::Types::PortalNavigation }, optional: true, nullable: false

        field :pages, -> { Auth0::Types::PortalPagesByType }, optional: true, nullable: false

        field :custom_code, -> { Auth0::Types::PortalCustomCode }, optional: true, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class PortalPage < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false

      field :slug, -> { String }, optional: false, nullable: false

      field :components, -> { Internal::Types::Array[Auth0::Types::PageComponent] }, optional: true, nullable: false
    end
  end
end

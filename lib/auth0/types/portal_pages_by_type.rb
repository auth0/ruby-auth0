# frozen_string_literal: true

module Auth0
  module Types
    class PortalPagesByType < Internal::Types::Model
      field :default, -> { String }, optional: true, nullable: false

      field :standard, -> { Internal::Types::Array[Auth0::Types::PortalPage] }, optional: true, nullable: false
    end
  end
end

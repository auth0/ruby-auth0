# frozen_string_literal: true

module Auth0
  module Types
    class PortalCustomCode < Internal::Types::Model
      field :head, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class AculOrganizationFilterByMetadata < Internal::Types::Model
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end

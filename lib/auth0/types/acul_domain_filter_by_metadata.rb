# frozen_string_literal: true

module Auth0
  module Types
    class AculDomainFilterByMetadata < Internal::Types::Model
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end

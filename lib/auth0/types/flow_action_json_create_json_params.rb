# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionJSONCreateJSONParams < Internal::Types::Model
      field :object, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end

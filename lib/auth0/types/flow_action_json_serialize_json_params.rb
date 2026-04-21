# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionJSONSerializeJSONParams < Internal::Types::Model
      field :object, -> { Auth0::Types::FlowActionJSONSerializeJSONParamsObject }, optional: false, nullable: false
    end
  end
end

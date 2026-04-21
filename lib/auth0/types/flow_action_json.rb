# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionJSON < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionJSONCreateJSON }
      member -> { Auth0::Types::FlowActionJSONParseJSON }
      member -> { Auth0::Types::FlowActionJSONSerializeJSON }
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionXML < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionXMLParseXML }
      member -> { Auth0::Types::FlowActionXMLSerializeXML }
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAirtable < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionAirtableCreateRecord }
      member -> { Auth0::Types::FlowActionAirtableListRecords }
      member -> { Auth0::Types::FlowActionAirtableUpdateRecord }
    end
  end
end

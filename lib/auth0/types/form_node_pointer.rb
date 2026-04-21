# frozen_string_literal: true

module Auth0
  module Types
    class FormNodePointer < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Auth0::Types::FormEndingNodeID }
    end
  end
end

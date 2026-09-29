# frozen_string_literal: true

module Auth0
  module Types
    class SegmentMatchExpression < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Internal::Types::Array[String] }

      member -> { Auth0::Types::SegmentContainsExpression }

      member -> { Auth0::Types::SegmentStartsWithExpression }

      member -> { Auth0::Types::SegmentEndsWithExpression }

      member -> { Auth0::Types::SegmentExistsExpression }
    end
  end
end

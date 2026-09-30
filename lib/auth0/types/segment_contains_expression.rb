# frozen_string_literal: true

module Auth0
  module Types
    class SegmentContainsExpression < Internal::Types::Model
      field :contains, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class SegmentEndsWithExpression < Internal::Types::Model
      field :ends_with, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end

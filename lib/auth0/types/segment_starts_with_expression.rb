# frozen_string_literal: true

module Auth0
  module Types
    class SegmentStartsWithExpression < Internal::Types::Model
      field :starts_with, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end

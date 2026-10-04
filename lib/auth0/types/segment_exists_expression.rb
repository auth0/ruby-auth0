# frozen_string_literal: true

module Auth0
  module Types
    class SegmentExistsExpression < Internal::Types::Model
      field :exists, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end

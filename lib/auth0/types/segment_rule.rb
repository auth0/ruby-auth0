# frozen_string_literal: true

module Auth0
  module Types
    class SegmentRule < Internal::Types::Model
      field :match, -> { Auth0::Types::SegmentMatchConditions }, optional: true, nullable: false

      field :not_match, -> { Auth0::Types::SegmentNotMatchConditions }, optional: true, nullable: false
    end
  end
end

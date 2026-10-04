# frozen_string_literal: true

module Auth0
  module Experimentation
    module Segments
      module Types
        class ListSegmentsRequestParameters < Internal::Types::Model
          field :from, -> { String }, optional: true, nullable: false

          field :take, -> { Integer }, optional: true, nullable: false

          field :type, -> { Auth0::Types::SegmentTypeFilterEnum }, optional: true, nullable: false
        end
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Experimentation
    module Segments
      module Types
        class CreateSegmentRequestContent < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :rules, -> { Internal::Types::Array[Auth0::Types::SegmentRule] }, optional: false, nullable: false
        end
      end
    end
  end
end

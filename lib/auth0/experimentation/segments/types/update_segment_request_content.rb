# frozen_string_literal: true

module Auth0
  module Experimentation
    module Segments
      module Types
        class UpdateSegmentRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :name, -> { String }, optional: true, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :rules, -> { Internal::Types::Array[Auth0::Types::SegmentRule] }, optional: true, nullable: false
        end
      end
    end
  end
end

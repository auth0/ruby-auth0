# frozen_string_literal: true

module Auth0
  module Types
    class AllocationRequestItem < Internal::Types::Model
      field :variation_id, -> { String }, optional: false, nullable: false

      field :weight, -> { Integer }, optional: true, nullable: false

      field :segment_id, -> { String }, optional: true, nullable: false

      field :priority, -> { Integer }, optional: true, nullable: false

      field :is_control, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :is_fallback, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

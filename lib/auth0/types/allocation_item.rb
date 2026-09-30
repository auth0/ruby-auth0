# frozen_string_literal: true

module Auth0
  module Types
    class AllocationItem < Internal::Types::Model
      field :variation_id, -> { String }, optional: true, nullable: false

      field :variation_name, -> { String }, optional: true, nullable: false

      field :segment_id, -> { String }, optional: true, nullable: false

      field :segment_name, -> { String }, optional: true, nullable: false

      field :weight, -> { Integer }, optional: true, nullable: false

      field :priority, -> { Integer }, optional: true, nullable: false

      field :is_control, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :is_fallback, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :variation_snapshot, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :segment_snapshot, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

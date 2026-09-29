# frozen_string_literal: true

module Auth0
  module Types
    class UpdateSegmentResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :type, -> { Auth0::Types::SegmentTypeEnum }, optional: false, nullable: false

      field :rules, -> { Internal::Types::Array[Auth0::Types::SegmentRule] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class CreateVariationResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :feature_flag_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :overrides, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end

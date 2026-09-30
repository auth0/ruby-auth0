# frozen_string_literal: true

module Auth0
  module Types
    class CreateExperimentResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :feature_flag_id, -> { String }, optional: false, nullable: false

      field :feature_flag_name, -> { String }, optional: true, nullable: false

      field :authentication_flow, -> { String }, optional: false, nullable: false

      field :allocation_strategy, -> { Auth0::Types::AllocationStrategyEnum }, optional: false, nullable: false

      field :status, -> { Auth0::Types::ExperimentStatusEnum }, optional: false, nullable: false

      field :is_valid, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :default_config, -> { Auth0::Types::DefaultConfigEnum }, optional: true, nullable: false

      field :feature_flag_snapshot, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :allocations, -> { Internal::Types::Array[Auth0::Types::AllocationItem] }, optional: false, nullable: false

      field :editable_fields, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :levels, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false

      field :current_level, -> { Integer }, optional: true, nullable: false

      field :started_at, -> { String }, optional: true, nullable: false

      field :ended_at, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Experimentation
    module Experiments
      module Types
        class CreateExperimentRequestContent < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :feature_flag_id, -> { String }, optional: false, nullable: false

          field :authentication_flow, -> { Auth0::Types::AuthenticationFlowEnum }, optional: false, nullable: false

          field :default_config, -> { Auth0::Types::DefaultConfigEnum }, optional: true, nullable: false

          field :allocation_strategy, -> { Auth0::Types::AllocationStrategyEnum }, optional: true, nullable: false

          field :allocations, -> { Internal::Types::Array[Auth0::Types::AllocationRequestItem] }, optional: true, nullable: false

          field :levels, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false
        end
      end
    end
  end
end

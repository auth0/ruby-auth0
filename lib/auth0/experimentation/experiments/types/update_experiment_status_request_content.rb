# frozen_string_literal: true

module Auth0
  module Experimentation
    module Experiments
      module Types
        class UpdateExperimentStatusRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :status, -> { Auth0::Types::ExperimentTransitionStatusEnum }, optional: false, nullable: false
        end
      end
    end
  end
end

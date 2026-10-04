# frozen_string_literal: true

module Auth0
  module Experimentation
    module Experiments
      module Types
        class AdvanceRampRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :target_level, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end

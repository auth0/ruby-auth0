# frozen_string_literal: true

module Auth0
  module Experimentation
    module Experiments
      module Types
        class ListExperimentsRequestParameters < Internal::Types::Model
          field :from, -> { String }, optional: true, nullable: false

          field :take, -> { Integer }, optional: true, nullable: false

          field :status, -> { Auth0::Types::ExperimentStatusEnum }, optional: true, nullable: false

          field :authentication_flow, -> { String }, optional: true, nullable: false

          field :feature_flag_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end

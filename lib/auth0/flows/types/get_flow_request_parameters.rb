# frozen_string_literal: true

module Auth0
  module Flows
    module Types
      class GetFlowRequestParameters < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :hydrate, -> { Auth0::Types::GetFlowRequestParametersHydrateEnum }, optional: true, nullable: false
      end
    end
  end
end

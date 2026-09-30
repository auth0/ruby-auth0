# frozen_string_literal: true

module Auth0
  module Types
    class ListExperimentsResponseContent < Internal::Types::Model
      field :experiments, -> { Internal::Types::Array[Auth0::Types::ExperimentListItem] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end

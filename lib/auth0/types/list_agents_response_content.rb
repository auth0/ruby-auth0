# frozen_string_literal: true

module Auth0
  module Types
    class ListAgentsResponseContent < Internal::Types::Model
      field :agents, -> { Internal::Types::Array[Auth0::Types::AgentResponseContent] }, optional: false, nullable: false

      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end

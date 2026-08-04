# frozen_string_literal: true

module Auth0
  module Agents
    module Types
      class CreateAgentRequestContent < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :client_id, -> { String }, optional: true, nullable: false

        field :external_agent_id, -> { String }, optional: true, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end

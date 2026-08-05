# frozen_string_literal: true

module Auth0
  module Types
    class AgentResponseContent < Internal::Types::Model
      field :agent_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false

      field :external_agent_id, -> { String }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end

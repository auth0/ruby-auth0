# frozen_string_literal: true

module Auth0
  module Agents
    module Types
      class PatchAgentRequestParameters < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end

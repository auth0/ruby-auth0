# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0CreateUserParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end

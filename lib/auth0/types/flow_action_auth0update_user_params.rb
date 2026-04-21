# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0UpdateUserParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :user_id, -> { String }, optional: false, nullable: false
      field :changes, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end

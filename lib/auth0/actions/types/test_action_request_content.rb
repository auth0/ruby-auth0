# frozen_string_literal: true

module Auth0
  module Actions
    module Types
      class TestActionRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      end
    end
  end
end

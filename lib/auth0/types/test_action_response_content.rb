# frozen_string_literal: true

module Auth0
  module Types
    class TestActionResponseContent < Internal::Types::Model
      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

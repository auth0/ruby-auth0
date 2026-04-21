# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionJwtDecodeJwtParams < Internal::Types::Model
      field :token, -> { String }, optional: false, nullable: false
    end
  end
end

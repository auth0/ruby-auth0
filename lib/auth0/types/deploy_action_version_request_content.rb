# frozen_string_literal: true

module Auth0
  module Types
    class DeployActionVersionRequestContent < Internal::Types::Model
      field :update_draft, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class GetActionModuleActionsResponseContent < Internal::Types::Model
      field :actions, -> { Internal::Types::Array[Auth0::Types::ActionModuleAction] }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :page, -> { Integer }, optional: true, nullable: false
      field :per_page, -> { Integer }, optional: true, nullable: false
    end
  end
end

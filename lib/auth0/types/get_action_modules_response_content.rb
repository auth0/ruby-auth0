# frozen_string_literal: true

module Auth0
  module Types
    class GetActionModulesResponseContent < Internal::Types::Model
      field :modules, -> { Internal::Types::Array[Auth0::Types::ActionModuleListItem] }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :page, -> { Integer }, optional: true, nullable: false
      field :per_page, -> { Integer }, optional: true, nullable: false
    end
  end
end

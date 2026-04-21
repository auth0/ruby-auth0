# frozen_string_literal: true

module Auth0
  module Types
    class GetActionModuleVersionsResponseContent < Internal::Types::Model
      field :versions, -> { Internal::Types::Array[Auth0::Types::ActionModuleVersion] }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :page, -> { Integer }, optional: true, nullable: false
      field :per_page, -> { Integer }, optional: true, nullable: false
    end
  end
end

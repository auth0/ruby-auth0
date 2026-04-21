# frozen_string_literal: true

module Auth0
  module Types
    class CreateExportUsersFields < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :export_as, -> { String }, optional: true, nullable: false
    end
  end
end

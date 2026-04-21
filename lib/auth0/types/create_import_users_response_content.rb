# frozen_string_literal: true

module Auth0
  module Types
    class CreateImportUsersResponseContent < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :connection_id, -> { String }, optional: false, nullable: false
      field :external_id, -> { String }, optional: true, nullable: false
    end
  end
end

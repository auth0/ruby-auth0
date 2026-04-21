# frozen_string_literal: true

module Auth0
  module Types
    class CreateExportUsersResponseContent < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :connection_id, -> { String }, optional: true, nullable: false
      field :format, -> { Auth0::Types::JobFileFormatEnum }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :fields, -> { Internal::Types::Array[Auth0::Types::CreateExportUsersFields] }, optional: true, nullable: false
    end
  end
end

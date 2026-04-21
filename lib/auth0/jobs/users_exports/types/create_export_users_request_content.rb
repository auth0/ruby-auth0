# frozen_string_literal: true

module Auth0
  module Jobs
    module UsersExports
      module Types
        class CreateExportUsersRequestContent < Internal::Types::Model
          field :connection_id, -> { String }, optional: true, nullable: false
          field :format, -> { Auth0::Types::JobFileFormatEnum }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :fields, -> { Internal::Types::Array[Auth0::Types::CreateExportUsersFields] }, optional: true, nullable: false
        end
      end
    end
  end
end

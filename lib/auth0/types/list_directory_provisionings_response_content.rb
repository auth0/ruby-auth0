# frozen_string_literal: true

module Auth0
  module Types
    class ListDirectoryProvisioningsResponseContent < Internal::Types::Model
      field :directory_provisionings, -> { Internal::Types::Array[Auth0::Types::DirectoryProvisioning] }, optional: false, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end

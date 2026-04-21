# frozen_string_literal: true

module Auth0
  module Types
    class DirectoryProvisioningMappingItem < Internal::Types::Model
      field :auth0, -> { String }, optional: false, nullable: false
      field :idp, -> { String }, optional: false, nullable: false
    end
  end
end

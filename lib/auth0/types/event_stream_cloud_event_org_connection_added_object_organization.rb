# frozen_string_literal: true

module Auth0
  module Types
    # Information about an Auth0 Organization.
    class EventStreamCloudEventOrgConnectionAddedObjectOrganization < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end

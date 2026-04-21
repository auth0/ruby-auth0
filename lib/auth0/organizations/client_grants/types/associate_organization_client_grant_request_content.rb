# frozen_string_literal: true

module Auth0
  module Organizations
    module ClientGrants
      module Types
        class AssociateOrganizationClientGrantRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :grant_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end

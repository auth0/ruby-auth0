# frozen_string_literal: true

module Auth0
  module Organizations
    module Members
      module Types
        class CreateOrganizationMemberRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :members, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end

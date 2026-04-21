# frozen_string_literal: true

module Auth0
  module Groups
    module Members
      module Types
        class GetGroupMembersRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :fields, -> { String }, optional: true, nullable: false
          field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :from, -> { String }, optional: true, nullable: false
          field :take, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end

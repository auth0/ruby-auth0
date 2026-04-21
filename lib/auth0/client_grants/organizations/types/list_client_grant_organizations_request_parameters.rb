# frozen_string_literal: true

module Auth0
  module ClientGrants
    module Organizations
      module Types
        class ListClientGrantOrganizationsRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :from, -> { String }, optional: true, nullable: false
          field :take, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end

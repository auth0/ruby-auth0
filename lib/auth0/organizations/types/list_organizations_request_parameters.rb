# frozen_string_literal: true

module Auth0
  module Organizations
    module Types
      class ListOrganizationsRequestParameters < Internal::Types::Model
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :from, -> { String }, optional: true, nullable: false

        field :take, -> { Integer }, optional: true, nullable: false

        field :sort, -> { String }, optional: true, nullable: false

        field :include_client_association_for, -> { String }, optional: true, nullable: false
      end
    end
  end
end

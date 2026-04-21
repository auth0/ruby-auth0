# frozen_string_literal: true

module Auth0
  module Roles
    module Types
      class ListRolesRequestParameters < Internal::Types::Model
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :page, -> { Integer }, optional: true, nullable: false
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :name_filter, -> { String }, optional: true, nullable: false
      end
    end
  end
end

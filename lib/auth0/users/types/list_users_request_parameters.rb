# frozen_string_literal: true

module Auth0
  module Users
    module Types
      class ListUsersRequestParameters < Internal::Types::Model
        field :page, -> { Integer }, optional: true, nullable: false
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :sort, -> { String }, optional: true, nullable: false
        field :connection, -> { String }, optional: true, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :q, -> { String }, optional: true, nullable: false
        field :search_engine, -> { Auth0::Types::SearchEngineVersionsEnum }, optional: true, nullable: false
        field :primary_order, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module ResourceServers
    module Types
      class SearchResourceServersRequestParameters < Internal::Types::Model
        field :q, -> { String }, optional: true, nullable: false

        field :parser, -> { Auth0::Types::SearchParserEnum }, optional: true, nullable: false

        field :fields, -> { String }, optional: true, nullable: false

        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :take, -> { Integer }, optional: true, nullable: false

        field :from, -> { String }, optional: true, nullable: false

        field :sort, -> { Auth0::Types::ResourceServerSortFieldEnum }, optional: true, nullable: false
      end
    end
  end
end

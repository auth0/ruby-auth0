# frozen_string_literal: true

module Auth0
  module Groups
    module Types
      class ListGroupsRequestParameters < Internal::Types::Model
        field :connection_id, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :external_id, -> { String }, optional: true, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :from, -> { String }, optional: true, nullable: false
        field :take, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class ListGroupsPaginatedResponseContent < Internal::Types::Model
      field :groups, -> { Internal::Types::Array[Auth0::Types::Group] }, optional: false, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
    end
  end
end

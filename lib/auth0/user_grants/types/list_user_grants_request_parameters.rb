# frozen_string_literal: true

module Auth0
  module UserGrants
    module Types
      class ListUserGrantsRequestParameters < Internal::Types::Model
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :page, -> { Integer }, optional: true, nullable: false
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :user_id, -> { String }, optional: true, nullable: false
        field :client_id, -> { String }, optional: true, nullable: false
        field :audience, -> { String }, optional: true, nullable: false
      end
    end
  end
end

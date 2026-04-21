# frozen_string_literal: true

module Auth0
  module ResourceServers
    module Types
      class ListResourceServerRequestParameters < Internal::Types::Model
        field :identifiers, -> { String }, optional: true, nullable: false
        field :page, -> { Integer }, optional: true, nullable: false
        field :per_page, -> { Integer }, optional: true, nullable: false
        field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end

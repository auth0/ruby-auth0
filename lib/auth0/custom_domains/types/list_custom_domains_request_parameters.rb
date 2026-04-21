# frozen_string_literal: true

module Auth0
  module CustomDomains
    module Types
      class ListCustomDomainsRequestParameters < Internal::Types::Model
        field :q, -> { String }, optional: true, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
        field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :sort, -> { String }, optional: true, nullable: false
      end
    end
  end
end

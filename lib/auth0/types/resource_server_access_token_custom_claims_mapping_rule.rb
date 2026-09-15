# frozen_string_literal: true

module Auth0
  module Types
    class ResourceServerAccessTokenCustomClaimsMappingRule < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :expression, -> { String }, optional: false, nullable: false
    end
  end
end

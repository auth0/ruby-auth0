# frozen_string_literal: true

module Auth0
  module Types
    class OrganizationConnectionInformation < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :strategy, -> { String }, optional: true, nullable: false
    end
  end
end

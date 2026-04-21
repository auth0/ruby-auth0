# frozen_string_literal: true

module Auth0
  module Types
    class ResourceServerScope < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end

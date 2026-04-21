# frozen_string_literal: true

module Auth0
  module Types
    class HTTPCustomHeader < Internal::Types::Model
      field :header, -> { String }, optional: true, nullable: false
      field :value, -> { String }, optional: true, nullable: false
    end
  end
end

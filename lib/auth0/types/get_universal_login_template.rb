# frozen_string_literal: true

module Auth0
  module Types
    class GetUniversalLoginTemplate < Internal::Types::Model
      field :body, -> { String }, optional: true, nullable: false
    end
  end
end

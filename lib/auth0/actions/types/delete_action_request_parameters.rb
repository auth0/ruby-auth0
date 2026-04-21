# frozen_string_literal: true

module Auth0
  module Actions
    module Types
      class DeleteActionRequestParameters < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :force, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end

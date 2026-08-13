# frozen_string_literal: true

module Auth0
  module UserBlocks
    module Types
      class DeleteUserBlocksByIdentifierRequestParameters < Internal::Types::Model
        field :identifier, -> { String }, optional: false, nullable: false
      end
    end
  end
end

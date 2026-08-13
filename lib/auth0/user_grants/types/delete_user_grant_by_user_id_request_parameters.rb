# frozen_string_literal: true

module Auth0
  module UserGrants
    module Types
      class DeleteUserGrantByUserIDRequestParameters < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end

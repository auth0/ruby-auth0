# frozen_string_literal: true

module Auth0
  module Users
    module Sessions
      module Types
        class ListUserSessionsRequestParameters < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :from, -> { String }, optional: true, nullable: false
          field :take, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end

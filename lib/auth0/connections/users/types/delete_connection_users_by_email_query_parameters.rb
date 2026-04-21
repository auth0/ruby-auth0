# frozen_string_literal: true

module Auth0
  module Connections
    module Users
      module Types
        class DeleteConnectionUsersByEmailQueryParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :email, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end

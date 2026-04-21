# frozen_string_literal: true

module Auth0
  module Types
    class UserBlockIdentifier < Internal::Types::Model
      field :identifier, -> { String }, optional: true, nullable: false
      field :ip, -> { String }, optional: true, nullable: false
      field :connection, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class ConsentSigningKey < Internal::Types::Model
      field :kid, -> { String }, optional: false, nullable: false

      field :device_identifier, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: false
    end
  end
end

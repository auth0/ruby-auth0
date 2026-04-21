# frozen_string_literal: true

module Auth0
  module Types
    class ClientSigningKey < Internal::Types::Model
      field :pkcs7, -> { String }, optional: true, nullable: false
      field :cert, -> { String }, optional: true, nullable: false
      field :subject, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class ListEncryptionKeyOffsetPaginatedResponseContent < Internal::Types::Model
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
      field :keys, -> { Internal::Types::Array[Auth0::Types::EncryptionKey] }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class ListAculsOffsetPaginatedResponseContent < Internal::Types::Model
      field :configs, -> { Internal::Types::Array[Auth0::Types::ListAculsResponseContentItem] }, optional: true, nullable: false
      field :start, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
    end
  end
end

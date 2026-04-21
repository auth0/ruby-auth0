# frozen_string_literal: true

module Auth0
  module Types
    class BulkUpdateAculResponseContent < Internal::Types::Model
      field :configs, -> { Internal::Types::Array[Auth0::Types::AculConfigsItem] }, optional: false, nullable: false
    end
  end
end

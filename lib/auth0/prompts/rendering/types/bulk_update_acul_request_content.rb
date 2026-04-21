# frozen_string_literal: true

module Auth0
  module Prompts
    module Rendering
      module Types
        class BulkUpdateAculRequestContent < Internal::Types::Model
          field :configs, -> { Internal::Types::Array[Auth0::Types::AculConfigsItem] }, optional: false, nullable: false
        end
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module UserBlocks
    module Types
      class ListUserBlocksRequestParameters < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :consider_brute_force_enablement, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end

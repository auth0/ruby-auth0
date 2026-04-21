# frozen_string_literal: true

module Auth0
  module Hooks
    module Types
      class GetHookRequestParameters < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :fields, -> { String }, optional: true, nullable: false
      end
    end
  end
end

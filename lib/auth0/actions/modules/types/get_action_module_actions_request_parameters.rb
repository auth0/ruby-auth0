# frozen_string_literal: true

module Auth0
  module Actions
    module Modules
      module Types
        class GetActionModuleActionsRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :page, -> { Integer }, optional: true, nullable: false
          field :per_page, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Actions
    module Modules
      module Types
        class GetActionModulesRequestParameters < Internal::Types::Model
          field :page, -> { Integer }, optional: true, nullable: false
          field :per_page, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end

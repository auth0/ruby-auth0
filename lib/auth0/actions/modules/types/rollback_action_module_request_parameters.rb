# frozen_string_literal: true

module Auth0
  module Actions
    module Modules
      module Types
        class RollbackActionModuleRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :module_version_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end

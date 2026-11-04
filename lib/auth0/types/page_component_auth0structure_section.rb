# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0StructureSection < Internal::Types::Model
      field :config, -> { Auth0::Types::PageComponentAuth0StructureSectionConfig }, optional: false, nullable: false
    end
  end
end

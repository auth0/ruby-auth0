# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0StructureSectionConfig < Internal::Types::Model
      field :title, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :variant, -> { Auth0::Types::PageComponentAuth0StructureSectionVariantEnum }, optional: false, nullable: false

      field :children, -> { Internal::Types::Array[Auth0::Types::PageComponentNoChildren] }, optional: false, nullable: false
    end
  end
end

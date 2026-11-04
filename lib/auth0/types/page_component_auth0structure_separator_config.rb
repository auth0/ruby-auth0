# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0StructureSeparatorConfig < Internal::Types::Model
      field :variant, -> { Auth0::Types::PageComponentAuth0StructureSeparatorVariantEnum }, optional: true, nullable: false

      field :text, -> { String }, optional: true, nullable: false
    end
  end
end

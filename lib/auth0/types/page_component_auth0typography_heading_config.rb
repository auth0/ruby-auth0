# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0TypographyHeadingConfig < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false
    end
  end
end

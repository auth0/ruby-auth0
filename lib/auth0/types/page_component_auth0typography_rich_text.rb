# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0TypographyRichText < Internal::Types::Model
      field :config, -> { Auth0::Types::PageComponentAuth0TypographyRichTextConfig }, optional: false, nullable: false
    end
  end
end

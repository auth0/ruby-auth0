# frozen_string_literal: true

module Auth0
  module Types
    class PageComponentAuth0TypographyHeading < Internal::Types::Model
      field :config, -> { Auth0::Types::PageComponentAuth0TypographyHeadingConfig }, optional: false, nullable: false
    end
  end
end

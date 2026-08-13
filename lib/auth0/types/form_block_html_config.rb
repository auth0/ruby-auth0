# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockHTMLConfig < Internal::Types::Model
      field :content, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockHTML < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :category, -> { Auth0::Types::FormComponentCategoryBlockConst }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FormBlockTypeHTMLConst }, optional: false, nullable: false
      field :config, -> { Auth0::Types::FormBlockHTMLConfig }, optional: true, nullable: false
    end
  end
end

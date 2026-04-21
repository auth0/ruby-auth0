# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockPreviousButton < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :category, -> { Auth0::Types::FormComponentCategoryBlockConst }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FormBlockTypePreviousButtonConst }, optional: false, nullable: false
      field :config, -> { Auth0::Types::FormBlockPreviousButtonConfig }, optional: false, nullable: false
    end
  end
end

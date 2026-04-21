# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockDivider < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :category, -> { Auth0::Types::FormComponentCategoryBlockConst }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FormBlockTypeDividerConst }, optional: false, nullable: false
      field :config, -> { Auth0::Types::FormBlockDividerConfig }, optional: true, nullable: false
    end
  end
end

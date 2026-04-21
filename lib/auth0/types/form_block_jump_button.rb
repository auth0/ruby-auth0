# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockJumpButton < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :category, -> { Auth0::Types::FormComponentCategoryBlockConst }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FormBlockTypeJumpButtonConst }, optional: false, nullable: false
      field :config, -> { Auth0::Types::FormBlockJumpButtonConfig }, optional: false, nullable: false
    end
  end
end

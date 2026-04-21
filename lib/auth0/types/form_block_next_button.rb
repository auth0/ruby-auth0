# frozen_string_literal: true

module Auth0
  module Types
    class FormBlockNextButton < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :category, -> { Auth0::Types::FormComponentCategoryBlockConst }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FormBlockTypeNextButtonConst }, optional: false, nullable: false
      field :config, -> { Auth0::Types::FormBlockNextButtonConfig }, optional: false, nullable: false
    end
  end
end

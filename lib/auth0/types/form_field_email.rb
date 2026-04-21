# frozen_string_literal: true

module Auth0
  module Types
    class FormFieldEmail < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :category, -> { Auth0::Types::FormComponentCategoryFieldConst }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FormFieldTypeEmailConst }, optional: false, nullable: false
      field :config, -> { Auth0::Types::FormFieldEmailConfig }, optional: true, nullable: false
      field :label, -> { String }, optional: true, nullable: false
      field :hint, -> { String }, optional: true, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :sensitive, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

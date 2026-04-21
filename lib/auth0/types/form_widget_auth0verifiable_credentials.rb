# frozen_string_literal: true

module Auth0
  module Types
    class FormWidgetAuth0VerifiableCredentials < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :category, -> { Auth0::Types::FormComponentCategoryWidgetConst }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FormWidgetTypeAuth0VerifiableCredentialsConst }, optional: false, nullable: false
      field :config, -> { Auth0::Types::FormWidgetAuth0VerifiableCredentialsConfig }, optional: false, nullable: false
      field :label, -> { String }, optional: true, nullable: false
      field :hint, -> { String }, optional: true, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :sensitive, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Param are form input values, primarily utilized when specifying secrets and
    # configuration values for actions.
    #
    # These are especially important for partner integrations -- but can be
    # exposed to tenant admins as well if they want to parameterize their custom
    # actions.
    class IntegrationRequiredParam < Internal::Types::Model
      field :type, -> { Auth0::Types::IntegrationRequiredParamTypeEnum }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :optional, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :label, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :default_value, -> { String }, optional: true, nullable: false
      field :placeholder, -> { String }, optional: true, nullable: false
      field :options, -> { Internal::Types::Array[Auth0::Types::IntegrationRequiredParamOption] }, optional: true, nullable: false
    end
  end
end

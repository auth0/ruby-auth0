# frozen_string_literal: true

module Auth0
  module Types
    class CreateSCIMConfigurationRequestContent < Internal::Types::Model
      field :user_id_attribute, -> { String }, optional: true, nullable: false
      field :mapping, -> { Internal::Types::Array[Auth0::Types::SCIMMappingItem] }, optional: true, nullable: false
    end
  end
end

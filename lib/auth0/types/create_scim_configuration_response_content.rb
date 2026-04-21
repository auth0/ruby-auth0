# frozen_string_literal: true

module Auth0
  module Types
    class CreateSCIMConfigurationResponseContent < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :connection_name, -> { String }, optional: false, nullable: false
      field :strategy, -> { String }, optional: false, nullable: false
      field :tenant_name, -> { String }, optional: false, nullable: false
      field :user_id_attribute, -> { String }, optional: false, nullable: false
      field :mapping, -> { Internal::Types::Array[Auth0::Types::SCIMMappingItem] }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :updated_on, -> { String }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Connections
    module SCIMConfiguration
      module Types
        class UpdateSCIMConfigurationRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :user_id_attribute, -> { String }, optional: false, nullable: false
          field :mapping, -> { Internal::Types::Array[Auth0::Types::SCIMMappingItem] }, optional: false, nullable: false
        end
      end
    end
  end
end

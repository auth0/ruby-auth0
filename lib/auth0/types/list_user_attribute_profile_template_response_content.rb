# frozen_string_literal: true

module Auth0
  module Types
    class ListUserAttributeProfileTemplateResponseContent < Internal::Types::Model
      field :user_attribute_profile_templates, -> { Internal::Types::Array[Auth0::Types::UserAttributeProfileTemplateItem] }, optional: true, nullable: false
    end
  end
end

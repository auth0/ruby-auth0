# frozen_string_literal: true

module Auth0
  module Types
    class ListConnectionProfileTemplateResponseContent < Internal::Types::Model
      field :connection_profile_templates, -> { Internal::Types::Array[Auth0::Types::ConnectionProfileTemplateItem] }, optional: true, nullable: false
    end
  end
end

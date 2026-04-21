# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionProfileTemplateItem < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :display_name, -> { String }, optional: true, nullable: false
      field :template, -> { Auth0::Types::ConnectionProfileTemplate }, optional: true, nullable: false
    end
  end
end

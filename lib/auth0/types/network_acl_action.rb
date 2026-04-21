# frozen_string_literal: true

module Auth0
  module Types
    class NetworkACLAction < Internal::Types::Model
      field :block, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allow, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :log, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :redirect, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :redirect_uri, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class TestCustomDomainResponseContent < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :message, -> { String }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class FormWidgetGMapsAddressConfig < Internal::Types::Model
      field :api_key, -> { String }, optional: false, nullable: false

      field :server_key, -> { String }, optional: true, nullable: false
    end
  end
end

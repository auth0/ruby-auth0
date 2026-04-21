# frozen_string_literal: true

module Auth0
  module Types
    class FormRouter < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :type, -> { Auth0::Types::FormNodeTypeRouterConst }, optional: false, nullable: false
      field :coordinates, -> { Auth0::Types::FormNodeCoordinates }, optional: true, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :config, -> { Auth0::Types::FormRouterConfig }, optional: true, nullable: false
    end
  end
end

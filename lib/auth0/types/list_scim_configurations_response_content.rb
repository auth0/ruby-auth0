# frozen_string_literal: true

module Auth0
  module Types
    class ListSCIMConfigurationsResponseContent < Internal::Types::Model
      field :scim_configurations, -> { Internal::Types::Array[Auth0::Types::SCIMConfiguration] }, optional: false, nullable: false
      field :next_, -> { String }, optional: true, nullable: false, api_name: "next"
    end
  end
end

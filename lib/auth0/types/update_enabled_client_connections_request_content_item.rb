# frozen_string_literal: true

module Auth0
  module Types
    class UpdateEnabledClientConnectionsRequestContentItem < Internal::Types::Model
      field :client_id, -> { String }, optional: false, nullable: false
      field :status, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end

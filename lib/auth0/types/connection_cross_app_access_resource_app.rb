# frozen_string_literal: true

module Auth0
  module Types
    # Cross App Access - Resource App settings that apply to this connection.
    class ConnectionCrossAppAccessResourceApp < Internal::Types::Model
      field :status, -> { Auth0::Types::ConnectionCrossAppAccessResourceAppStatusEnum }, optional: false, nullable: false
    end
  end
end

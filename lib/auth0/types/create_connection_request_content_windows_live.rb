# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=windowslive
    class CreateConnectionRequestContentWindowsLive < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentWindowsLiveStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsWindowsLive }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=windowslive
    class UpdateConnectionRequestContentWindowsLive < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsWindowsLive }, optional: true, nullable: false
    end
  end
end

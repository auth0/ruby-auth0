# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=soundcloud
    class UpdateConnectionRequestContentSoundcloud < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsSoundcloud }, optional: true, nullable: false
    end
  end
end

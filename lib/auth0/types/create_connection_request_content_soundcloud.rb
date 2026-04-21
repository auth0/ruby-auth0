# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=soundcloud
    class CreateConnectionRequestContentSoundcloud < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentSoundcloudStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsSoundcloud }, optional: true, nullable: false
    end
  end
end

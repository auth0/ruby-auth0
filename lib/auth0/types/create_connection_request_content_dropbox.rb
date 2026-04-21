# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=dropbox
    class CreateConnectionRequestContentDropbox < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentDropboxStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsDropbox }, optional: true, nullable: false
    end
  end
end

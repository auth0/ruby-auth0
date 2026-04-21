# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=dropbox
    class ConnectionResponseContentDropbox < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentDropboxStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsDropbox }, optional: true, nullable: false
    end
  end
end

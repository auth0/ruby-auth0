# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=dropbox
    class UpdateConnectionRequestContentDropbox < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsDropbox }, optional: true, nullable: false
    end
  end
end

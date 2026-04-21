# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=evernote
    class UpdateConnectionRequestContentEvernote < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsEvernote }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=evernote
    class CreateConnectionRequestContentEvernote < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentEvernoteStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsEvernote }, optional: true, nullable: false
    end
  end
end

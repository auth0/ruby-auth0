# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=evernote
    class ConnectionResponseContentEvernote < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentEvernoteStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsEvernote }, optional: true, nullable: false
    end
  end
end

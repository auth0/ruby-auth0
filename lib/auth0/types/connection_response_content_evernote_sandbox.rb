# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=evernote-sandbox
    class ConnectionResponseContentEvernoteSandbox < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentEvernoteSandboxStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsEvernote }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # The identity of the delegating party/session actor for delegated sessions. Present only on delegated sessions.
    # Contains "sub" and up to 5 additional primitive claims.
    class SessionActorMetadata < Internal::Types::Model
      field :sub, -> { String }, optional: false, nullable: false
    end
  end
end

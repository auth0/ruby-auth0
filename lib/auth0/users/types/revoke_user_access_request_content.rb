# frozen_string_literal: true

module Auth0
  module Users
    module Types
      class RevokeUserAccessRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :session_id, -> { String }, optional: true, nullable: false
        field :preserve_refresh_tokens, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end

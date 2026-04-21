# frozen_string_literal: true

module Auth0
  module Sessions
    module Types
      class UpdateSessionRequestContent < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :session_metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # The IDP-specific identifer for the user.
    class EventStreamCloudEventUserCreatedObjectIdentitiesItemSocialUserID < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Integer }
    end
  end
end

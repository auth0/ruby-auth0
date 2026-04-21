# frozen_string_literal: true

module Auth0
  module Types
    # Custom scripts to transform user profile data or modify OAuth1 flow behavior
    class ConnectionScriptsOAuth1 < Internal::Types::Model
      field :fetch_user_profile, -> { String }, optional: true, nullable: false, api_name: "fetchUserProfile"
    end
  end
end

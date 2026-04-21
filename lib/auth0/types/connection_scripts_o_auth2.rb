# frozen_string_literal: true

module Auth0
  module Types
    # Custom scripts to transform user profile data or modify OAuth2 flow behavior
    class ConnectionScriptsOAuth2 < Internal::Types::Model
      field :fetch_user_profile, -> { String }, optional: true, nullable: false, api_name: "fetchUserProfile"
      field :get_logout_url, -> { String }, optional: true, nullable: false, api_name: "getLogoutUrl"
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # OAuth 2.0 PKCE (Proof Key for Code Exchange) settings. PKCE enhances security for public clients by preventing
    # authorization code interception attacks. 'auto' (recommended) uses the strongest method supported by the IdP.
    class EventStreamCloudEventConnectionUpdatedObject1OptionsConnectionSettings < Internal::Types::Model
      field :pkce, -> { Auth0::Types::EventStreamCloudEventConnectionUpdatedObject1OptionsConnectionSettingsPkceEnum }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Microsoft Dynamics CRM SSO configuration.
    class ClientAddonMscrm < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamMixpanelSink < Internal::Types::Model
      field :mixpanel_region, -> { Auth0::Types::LogStreamMixpanelRegionEnum }, optional: false, nullable: false, api_name: "mixpanelRegion"
      field :mixpanel_project_id, -> { String }, optional: false, nullable: false, api_name: "mixpanelProjectId"
      field :mixpanel_service_account_username, -> { String }, optional: false, nullable: false, api_name: "mixpanelServiceAccountUsername"
      field :mixpanel_service_account_password, -> { String }, optional: false, nullable: false, api_name: "mixpanelServiceAccountPassword"
    end
  end
end

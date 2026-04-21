# frozen_string_literal: true

module Auth0
  module Types
    # Addons enabled for this client and their associated configurations.
    class ClientAddons < Internal::Types::Model
      field :aws, -> { Auth0::Types::ClientAddonAws }, optional: true, nullable: false
      field :azure_blob, -> { Auth0::Types::ClientAddonAzureBlob }, optional: true, nullable: false
      field :azure_sb, -> { Auth0::Types::ClientAddonAzureSb }, optional: true, nullable: false
      field :rms, -> { Auth0::Types::ClientAddonRms }, optional: true, nullable: false
      field :mscrm, -> { Auth0::Types::ClientAddonMscrm }, optional: true, nullable: false
      field :slack, -> { Auth0::Types::ClientAddonSlack }, optional: true, nullable: false
      field :sentry, -> { Auth0::Types::ClientAddonSentry }, optional: true, nullable: false
      field :box, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :cloudbees, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :concur, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :dropbox, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :echosign, -> { Auth0::Types::ClientAddonEchoSign }, optional: true, nullable: false
      field :egnyte, -> { Auth0::Types::ClientAddonEgnyte }, optional: true, nullable: false
      field :firebase, -> { Auth0::Types::ClientAddonFirebase }, optional: true, nullable: false
      field :newrelic, -> { Auth0::Types::ClientAddonNewRelic }, optional: true, nullable: false
      field :office365, -> { Auth0::Types::ClientAddonOffice365 }, optional: true, nullable: false
      field :salesforce, -> { Auth0::Types::ClientAddonSalesforce }, optional: true, nullable: false
      field :salesforce_api, -> { Auth0::Types::ClientAddonSalesforceAPI }, optional: true, nullable: false
      field :salesforce_sandbox_api, -> { Auth0::Types::ClientAddonSalesforceSandboxAPI }, optional: true, nullable: false
      field :samlp, -> { Auth0::Types::ClientAddonSAML }, optional: true, nullable: false
      field :layer, -> { Auth0::Types::ClientAddonLayer }, optional: true, nullable: false
      field :sap_api, -> { Auth0::Types::ClientAddonSapapi }, optional: true, nullable: false
      field :sharepoint, -> { Auth0::Types::ClientAddonSharePoint }, optional: true, nullable: false
      field :springcm, -> { Auth0::Types::ClientAddonSpringCm }, optional: true, nullable: false
      field :wams, -> { Auth0::Types::ClientAddonWams }, optional: true, nullable: false
      field :wsfed, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :zendesk, -> { Auth0::Types::ClientAddonZendesk }, optional: true, nullable: false
      field :zoom, -> { Auth0::Types::ClientAddonZoom }, optional: true, nullable: false
      field :sso_integration, -> { Auth0::Types::ClientAddonSSOIntegration }, optional: true, nullable: false
      field :oag, -> { Auth0::Types::ClientAddonOag }, optional: true, nullable: false
    end
  end
end

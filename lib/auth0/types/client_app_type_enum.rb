# frozen_string_literal: true

module Auth0
  module Types
    module ClientAppTypeEnum
      extend Auth0::Internal::Types::Enum

      NATIVE = "native"
      SPA = "spa"
      REGULAR_WEB = "regular_web"
      NON_INTERACTIVE = "non_interactive"
      RESOURCE_SERVER = "resource_server"
      EXPRESS_CONFIGURATION = "express_configuration"
      RMS = "rms"
      BOX = "box"
      CLOUDBEES = "cloudbees"
      CONCUR = "concur"
      DROPBOX = "dropbox"
      MSCRM = "mscrm"
      ECHOSIGN = "echosign"
      EGNYTE = "egnyte"
      NEWRELIC = "newrelic"
      OFFICE365 = "office365"
      SALESFORCE = "salesforce"
      SENTRY = "sentry"
      SHAREPOINT = "sharepoint"
      SLACK = "slack"
      SPRINGCM = "springcm"
      ZENDESK = "zendesk"
      ZOOM = "zoom"
      SSO_INTEGRATION = "sso_integration"
      OAG = "oag"
    end
  end
end

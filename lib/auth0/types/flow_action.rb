# frozen_string_literal: true

module Auth0
  module Types
    class FlowAction < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionActivecampaign }
      member -> { Auth0::Types::FlowActionAirtable }
      member -> { Auth0::Types::FlowActionAuth0 }
      member -> { Auth0::Types::FlowActionBigqueryInsertRows }
      member -> { Auth0::Types::FlowActionClearbit }
      member -> { Auth0::Types::FlowActionEmailVerifyEmail }
      member -> { Auth0::Types::FlowActionFlow }
      member -> { Auth0::Types::FlowActionGoogleSheetsAddRow }
      member -> { Auth0::Types::FlowActionHTTPSendRequest }
      member -> { Auth0::Types::FlowActionHubspot }
      member -> { Auth0::Types::FlowActionJSON }
      member -> { Auth0::Types::FlowActionJwt }
      member -> { Auth0::Types::FlowActionMailchimpUpsertMember }
      member -> { Auth0::Types::FlowActionMailjetSendEmail }
      member -> { Auth0::Types::FlowActionOtp }
      member -> { Auth0::Types::FlowActionPipedrive }
      member -> { Auth0::Types::FlowActionSalesforce }
      member -> { Auth0::Types::FlowActionSendgridSendEmail }
      member -> { Auth0::Types::FlowActionSlackPostMessage }
      member -> { Auth0::Types::FlowActionStripe }
      member -> { Auth0::Types::FlowActionTelegramSendMessage }
      member -> { Auth0::Types::FlowActionTwilio }
      member -> { Auth0::Types::FlowActionWhatsappSendMessage }
      member -> { Auth0::Types::FlowActionXML }
      member -> { Auth0::Types::FlowActionZapierTriggerWebhook }
    end
  end
end

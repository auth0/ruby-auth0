# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSalesforce < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionSalesforceCreateLead }
      member -> { Auth0::Types::FlowActionSalesforceGetLead }
      member -> { Auth0::Types::FlowActionSalesforceSearchLeads }
      member -> { Auth0::Types::FlowActionSalesforceUpdateLead }
    end
  end
end

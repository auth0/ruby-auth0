# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionActivecampaign < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionActivecampaignListContacts }
      member -> { Auth0::Types::FlowActionActivecampaignUpsertContact }
    end
  end
end

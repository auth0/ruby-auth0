# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionActivecampaignListContactsParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :email, -> { String }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamEventGridSink < Internal::Types::Model
      field :azure_subscription_id, -> { String }, optional: false, nullable: false, api_name: "azureSubscriptionId"
      field :azure_region, -> { Auth0::Types::LogStreamEventGridRegionEnum }, optional: false, nullable: false, api_name: "azureRegion"
      field :azure_resource_group, -> { String }, optional: false, nullable: false, api_name: "azureResourceGroup"
      field :azure_partner_topic, -> { String }, optional: true, nullable: false, api_name: "azurePartnerTopic"
    end
  end
end

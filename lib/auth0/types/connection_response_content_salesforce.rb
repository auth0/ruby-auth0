# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=salesforce
    class ConnectionResponseContentSalesforce < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentSalesforceStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsSalesforce }, optional: true, nullable: false
    end
  end
end

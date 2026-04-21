# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=salesforce-sandbox
    class CreateConnectionRequestContentSalesforceSandbox < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentSalesforceSandboxStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsSalesforce }, optional: true, nullable: false
    end
  end
end

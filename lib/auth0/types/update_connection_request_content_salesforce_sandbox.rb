# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=salesforce-sandbox
    class UpdateConnectionRequestContentSalesforceSandbox < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsSalesforce }, optional: true, nullable: false
    end
  end
end

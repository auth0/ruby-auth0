# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'pingfederate' connection
    class ConnectionOptionsPingFederate < Internal::Types::Model
      field :ping_federate_base_url, -> { String }, optional: false, nullable: false, api_name: "pingFederateBaseUrl"
      field :signing_cert, -> { String }, optional: true, nullable: false, api_name: "signingCert"
    end
  end
end

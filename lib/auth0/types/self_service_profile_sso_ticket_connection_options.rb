# frozen_string_literal: true

module Auth0
  module Types
    # The connection's options (depend on the connection strategy)
    class SelfServiceProfileSSOTicketConnectionOptions < Internal::Types::Model
      field :icon_url, -> { String }, optional: true, nullable: false
      field :domain_aliases, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :idpinitiated, -> { Auth0::Types::SelfServiceProfileSSOTicketIdpInitiatedOptions }, optional: true, nullable: false
    end
  end
end

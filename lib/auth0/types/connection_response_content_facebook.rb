# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=facebook
    class ConnectionResponseContentFacebook < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentFacebookStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsFacebook }, optional: true, nullable: false
    end
  end
end

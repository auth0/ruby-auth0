# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=facebook
    class CreateConnectionRequestContentFacebook < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentFacebookStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsFacebook }, optional: true, nullable: false
    end
  end
end

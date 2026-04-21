# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=facebook
    class UpdateConnectionRequestContentFacebook < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsFacebook }, optional: true, nullable: false
    end
  end
end

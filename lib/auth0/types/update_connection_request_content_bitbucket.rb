# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=bitbucket
    class UpdateConnectionRequestContentBitbucket < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsBitbucket }, optional: true, nullable: false
    end
  end
end

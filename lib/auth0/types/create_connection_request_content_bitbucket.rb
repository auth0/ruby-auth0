# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=bitbucket
    class CreateConnectionRequestContentBitbucket < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentBitbucketStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsBitbucket }, optional: true, nullable: false
    end
  end
end

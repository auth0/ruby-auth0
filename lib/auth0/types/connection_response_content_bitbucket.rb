# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=bitbucket
    class ConnectionResponseContentBitbucket < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentBitbucketStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsBitbucket }, optional: true, nullable: false
    end
  end
end

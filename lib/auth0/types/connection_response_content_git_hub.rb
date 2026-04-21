# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=github
    class ConnectionResponseContentGitHub < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentGitHubStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsGitHub }, optional: true, nullable: false
    end
  end
end

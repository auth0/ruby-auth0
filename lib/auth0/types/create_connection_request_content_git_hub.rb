# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=github
    class CreateConnectionRequestContentGitHub < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentGitHubStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsGitHub }, optional: true, nullable: false
    end
  end
end

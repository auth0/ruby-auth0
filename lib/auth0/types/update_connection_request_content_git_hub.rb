# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=github
    class UpdateConnectionRequestContentGitHub < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsGitHub }, optional: true, nullable: false
    end
  end
end

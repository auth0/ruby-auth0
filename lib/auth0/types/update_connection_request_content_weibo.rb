# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=weibo
    class UpdateConnectionRequestContentWeibo < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsWeibo }, optional: true, nullable: false
    end
  end
end

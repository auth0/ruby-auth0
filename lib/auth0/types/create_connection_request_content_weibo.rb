# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=weibo
    class CreateConnectionRequestContentWeibo < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentWeiboStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsWeibo }, optional: true, nullable: false
    end
  end
end

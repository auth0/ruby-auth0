# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=weibo
    class ConnectionResponseContentWeibo < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentWeiboStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsWeibo }, optional: true, nullable: false
    end
  end
end

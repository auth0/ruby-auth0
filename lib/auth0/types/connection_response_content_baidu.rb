# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=baidu
    class ConnectionResponseContentBaidu < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentBaiduStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsBaidu }, optional: true, nullable: false
    end
  end
end

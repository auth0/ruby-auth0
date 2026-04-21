# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=baidu
    class CreateConnectionRequestContentBaidu < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentBaiduStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsBaidu }, optional: true, nullable: false
    end
  end
end

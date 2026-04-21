# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=baidu
    class UpdateConnectionRequestContentBaidu < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsBaidu }, optional: true, nullable: false
    end
  end
end

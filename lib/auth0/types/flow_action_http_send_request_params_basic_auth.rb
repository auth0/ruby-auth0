# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionHTTPSendRequestParamsBasicAuth < Internal::Types::Model
      field :username, -> { String }, optional: true, nullable: false
      field :password, -> { String }, optional: true, nullable: false
    end
  end
end

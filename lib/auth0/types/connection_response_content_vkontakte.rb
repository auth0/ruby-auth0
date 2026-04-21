# frozen_string_literal: true

module Auth0
  module Types
    # Response for connections with strategy=vkontakte
    class ConnectionResponseContentVkontakte < Internal::Types::Model
      field :strategy, -> { Auth0::Types::ConnectionResponseContentVkontakteStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsVkontakte }, optional: true, nullable: false
    end
  end
end

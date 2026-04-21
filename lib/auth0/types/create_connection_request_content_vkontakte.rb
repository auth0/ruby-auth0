# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=vkontakte
    class CreateConnectionRequestContentVkontakte < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentVkontakteStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsVkontakte }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Update a connection with strategy=vkontakte
    class UpdateConnectionRequestContentVkontakte < Internal::Types::Model
      field :options, -> { Auth0::Types::ConnectionOptionsVkontakte }, optional: true, nullable: false
    end
  end
end

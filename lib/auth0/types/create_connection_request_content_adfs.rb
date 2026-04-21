# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=adfs
    class CreateConnectionRequestContentAdfs < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentAdfsStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsAdfs }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

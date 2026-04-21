# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=office365
    class CreateConnectionRequestContentOffice365 < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentOffice365Strategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsOffice365 }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Create a connection with strategy=samlp
    class CreateConnectionRequestContentSAML < Internal::Types::Model
      field :strategy, -> { Auth0::Types::CreateConnectionRequestContentSAMLStrategy }, optional: false, nullable: false
      field :options, -> { Auth0::Types::ConnectionOptionsSAML }, optional: true, nullable: false
      field :show_as_button, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

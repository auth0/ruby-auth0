# frozen_string_literal: true

module Auth0
  module Types
    # Windows Azure Mobile Services addon configuration.
    class ClientAddonWams < Internal::Types::Model
      field :masterkey, -> { String }, optional: true, nullable: false
    end
  end
end

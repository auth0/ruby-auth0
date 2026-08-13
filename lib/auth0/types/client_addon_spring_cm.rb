# frozen_string_literal: true

module Auth0
  module Types
    # SpringCM SSO configuration.
    class ClientAddonSpringCm < Internal::Types::Model
      field :acsurl, -> { String }, optional: true, nullable: false
    end
  end
end

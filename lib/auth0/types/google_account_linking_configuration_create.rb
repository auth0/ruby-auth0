# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for Google account linking.
    class GoogleAccountLinkingConfigurationCreate < Internal::Types::Model
      field :allow_streamlined_linking, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

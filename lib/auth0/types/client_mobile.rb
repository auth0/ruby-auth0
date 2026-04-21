# frozen_string_literal: true

module Auth0
  module Types
    # Additional configuration for native mobile apps.
    class ClientMobile < Internal::Types::Model
      field :android, -> { Auth0::Types::ClientMobileAndroid }, optional: true, nullable: false
      field :ios, -> { Auth0::Types::ClientMobileiOs }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Password policy options for flexible password policy configuration
    class ConnectionPasswordOptions < Internal::Types::Model
      field :complexity, -> { Auth0::Types::ConnectionPasswordOptionsComplexity }, optional: true, nullable: false
      field :dictionary, -> { Auth0::Types::ConnectionPasswordOptionsDictionary }, optional: true, nullable: false
      field :history, -> { Auth0::Types::ConnectionPasswordOptionsHistory }, optional: true, nullable: false
      field :profile_data, -> { Auth0::Types::ConnectionPasswordOptionsProfileData }, optional: true, nullable: false
    end
  end
end

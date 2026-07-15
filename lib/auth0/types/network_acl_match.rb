# frozen_string_literal: true

module Auth0
  module Types
    class NetworkACLMatch < Internal::Types::Model
      field :asns, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false

      field :auth0_managed, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :geo_country_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :geo_subdivision_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :ipv4_cidrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :ipv6_cidrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :ja3_fingerprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :ja4_fingerprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :user_agents, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :hostnames, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :connecting_ipv4_cidrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :connecting_ipv6_cidrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end

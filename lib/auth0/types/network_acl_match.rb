# frozen_string_literal: true

module Auth0
  module Types
    class NetworkACLMatch < Internal::Types::Model
      field :asns, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false
      field :geo_country_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :geo_subdivision_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :ipv4cidrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "ipv4_cidrs"
      field :ipv6cidrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "ipv6_cidrs"
      field :ja3fingerprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "ja3_fingerprints"
      field :ja4fingerprints, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "ja4_fingerprints"
      field :user_agents, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :hostnames, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :connecting_ipv4cidrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "connecting_ipv4_cidrs"
      field :connecting_ipv6cidrs, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "connecting_ipv6_cidrs"
    end
  end
end

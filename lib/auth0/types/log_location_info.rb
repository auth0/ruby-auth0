# frozen_string_literal: true

module Auth0
  module Types
    # Information about the location that triggered this event based on the `ip`.
    class LogLocationInfo < Internal::Types::Model
      field :country_code, -> { String }, optional: true, nullable: false
      field :country_code3, -> { String }, optional: true, nullable: false
      field :country_name, -> { String }, optional: true, nullable: false
      field :city_name, -> { String }, optional: true, nullable: false
      field :latitude, -> { Integer }, optional: true, nullable: false
      field :longitude, -> { Integer }, optional: true, nullable: false
      field :time_zone, -> { String }, optional: true, nullable: false
      field :continent_code, -> { String }, optional: true, nullable: false
    end
  end
end

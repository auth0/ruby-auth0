# frozen_string_literal: true

module Auth0
  module Types
    # Geographic information about the request origin.
    class EventStreamCloudEventContextRequestGeo < Internal::Types::Model
      field :continent_code, -> { String }, optional: true, nullable: false

      field :country_code, -> { String }, optional: true, nullable: false

      field :country_name, -> { String }, optional: true, nullable: false

      field :latitude, -> { Integer }, optional: true, nullable: false

      field :longitude, -> { Integer }, optional: true, nullable: false

      field :subdivision_code, -> { String }, optional: true, nullable: false

      field :subdivision_name, -> { String }, optional: true, nullable: false

      field :city_name, -> { String }, optional: true, nullable: false

      field :time_zone, -> { String }, optional: true, nullable: false
    end
  end
end

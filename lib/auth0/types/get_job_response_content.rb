# frozen_string_literal: true

module Auth0
  module Types
    class GetJobResponseContent < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :connection_id, -> { String }, optional: true, nullable: false
      field :location, -> { String }, optional: true, nullable: false
      field :percentage_done, -> { Integer }, optional: true, nullable: false
      field :time_left_seconds, -> { Integer }, optional: true, nullable: false
      field :format, -> { Auth0::Types::JobFileFormatEnum }, optional: true, nullable: false
      field :status_details, -> { String }, optional: true, nullable: false
      field :summary, -> { Auth0::Types::GetJobSummary }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # An HTTP request.
    class EventStreamCloudEventContextRequest < Internal::Types::Model
      field :geo, -> { Auth0::Types::EventStreamCloudEventContextRequestGeo }, optional: false, nullable: false
      field :hostname, -> { String }, optional: false, nullable: false
      field :custom_domain, -> { String }, optional: true, nullable: false
      field :ip, -> { String }, optional: false, nullable: false
      field :method_, -> { String }, optional: false, nullable: false, api_name: "method"
      field :user_agent, -> { String }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventOrgUpdatedPreviousObject < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :display_name, -> { String }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :branding, -> { Auth0::Types::EventStreamCloudEventOrgUpdatedPreviousObjectBranding }, optional: true, nullable: false
    end
  end
end

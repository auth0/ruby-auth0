# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionPipedriveAddOrganizationParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :owner_id, -> { Auth0::Types::FlowActionPipedriveAddOrganizationParamsOwnerID }, optional: true, nullable: false
      field :fields, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

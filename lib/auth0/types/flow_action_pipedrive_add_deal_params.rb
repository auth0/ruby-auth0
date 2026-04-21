# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionPipedriveAddDealParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: true, nullable: false
      field :user_id, -> { Auth0::Types::FlowActionPipedriveAddDealParamsUserID }, optional: true, nullable: false
      field :person_id, -> { Auth0::Types::FlowActionPipedriveAddDealParamsPersonID }, optional: true, nullable: false
      field :organization_id, -> { Auth0::Types::FlowActionPipedriveAddDealParamsOrganizationID }, optional: true, nullable: false
      field :stage_id, -> { Auth0::Types::FlowActionPipedriveAddDealParamsStageID }, optional: true, nullable: false
      field :fields, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

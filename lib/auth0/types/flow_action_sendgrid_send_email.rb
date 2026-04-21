# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionSendgridSendEmail < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :type, -> { Auth0::Types::FlowActionSendgridSendEmailType }, optional: false, nullable: false
      field :action, -> { Auth0::Types::FlowActionSendgridSendEmailAction }, optional: false, nullable: false
      field :allow_failure, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mask_output, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :params, -> { Auth0::Types::FlowActionSendgridSendEmailParams }, optional: false, nullable: false
    end
  end
end

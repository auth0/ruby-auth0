# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0SendEmail < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :type, -> { Auth0::Types::FlowActionAuth0SendEmailType }, optional: false, nullable: false
      field :action, -> { Auth0::Types::FlowActionAuth0SendEmailAction }, optional: false, nullable: false
      field :allow_failure, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mask_output, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :params, -> { Auth0::Types::FlowActionAuth0SendEmailParams }, optional: false, nullable: false
    end
  end
end

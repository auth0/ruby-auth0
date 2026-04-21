# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0SendSms < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
      field :type, -> { Auth0::Types::FlowActionAuth0SendSmsType }, optional: false, nullable: false
      field :action, -> { Auth0::Types::FlowActionAuth0SendSmsAction }, optional: false, nullable: false
      field :allow_failure, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mask_output, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :params, -> { Auth0::Types::FlowActionAuth0SendSmsParams }, optional: false, nullable: false
    end
  end
end

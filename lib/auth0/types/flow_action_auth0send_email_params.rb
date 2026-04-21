# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAuth0SendEmailParams < Internal::Types::Model
      field :from, -> { Auth0::Types::FlowActionAuth0SendEmailParamsFrom }, optional: true, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :subject, -> { String }, optional: false, nullable: false
      field :body, -> { String }, optional: false, nullable: false
      field :custom_vars, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

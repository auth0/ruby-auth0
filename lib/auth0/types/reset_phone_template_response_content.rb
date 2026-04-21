# frozen_string_literal: true

module Auth0
  module Types
    class ResetPhoneTemplateResponseContent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :channel, -> { String }, optional: true, nullable: false
      field :customizable, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :tenant, -> { String }, optional: true, nullable: false
      field :content, -> { Auth0::Types::PhoneTemplateContent }, optional: false, nullable: false
      field :type, -> { Auth0::Types::PhoneTemplateNotificationTypeEnum }, optional: false, nullable: false
      field :disabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end

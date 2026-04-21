# frozen_string_literal: true

module Auth0
  module Types
    class Log < Internal::Types::Model
      field :date, -> { Auth0::Types::LogDate }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :connection, -> { String }, optional: true, nullable: false
      field :connection_id, -> { String }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_name, -> { String }, optional: true, nullable: false
      field :ip, -> { String }, optional: true, nullable: false
      field :hostname, -> { String }, optional: true, nullable: false
      field :user_id, -> { String }, optional: true, nullable: false
      field :user_name, -> { String }, optional: true, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
      field :scope, -> { String }, optional: true, nullable: false
      field :strategy, -> { String }, optional: true, nullable: false
      field :strategy_type, -> { String }, optional: true, nullable: false
      field :log_id, -> { String }, optional: true, nullable: false
      field :is_mobile, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isMobile"
      field :details, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :user_agent, -> { String }, optional: true, nullable: false
      field :security_context, -> { Auth0::Types::LogSecurityContext }, optional: true, nullable: false
      field :location_info, -> { Auth0::Types::LogLocationInfo }, optional: true, nullable: false
    end
  end
end

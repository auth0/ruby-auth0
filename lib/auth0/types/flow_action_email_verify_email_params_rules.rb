# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionEmailVerifyEmailParamsRules < Internal::Types::Model
      field :require_mx_record, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :block_aliases, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :block_free_emails, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :block_disposable_emails, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :blocklist, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :allowlist, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end

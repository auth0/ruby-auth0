# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionMailchimpUpsertMemberParamsMember < Internal::Types::Model
      field :email_address, -> { String }, optional: false, nullable: false
      field :status_if_new, -> { String }, optional: false, nullable: false
      field :merge_fields, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionMailchimpUpsertMemberParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :list_id, -> { String }, optional: false, nullable: false
      field :member, -> { Auth0::Types::FlowActionMailchimpUpsertMemberParamsMember }, optional: false, nullable: false
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    # Attribute conditions that must match.
    class SegmentMatchConditions < Internal::Types::Model
      field :client_id, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :connection, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :connection_type, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :organization_id, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :domain, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :device_type, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :browser, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :platform, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :user_agent, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :country, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false

      field :region, -> { Auth0::Types::SegmentMatchExpression }, optional: true, nullable: false
    end
  end
end

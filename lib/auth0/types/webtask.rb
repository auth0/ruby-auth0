# frozen_string_literal: true

module Auth0
  module Types
    # A webtask in the tenant's container, as returned by the webtask platform.
    class Webtask < Internal::Types::Model
      field :container, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :token, -> { String }, optional: true, nullable: false

      field :meta, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false

      field :webtask_url, -> { String }, optional: true, nullable: false
    end
  end
end

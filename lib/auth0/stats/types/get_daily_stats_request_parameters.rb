# frozen_string_literal: true

module Auth0
  module Stats
    module Types
      class GetDailyStatsRequestParameters < Internal::Types::Model
        field :from, -> { String }, optional: true, nullable: false
        field :to, -> { String }, optional: true, nullable: false
      end
    end
  end
end

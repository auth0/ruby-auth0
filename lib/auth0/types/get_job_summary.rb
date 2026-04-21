# frozen_string_literal: true

module Auth0
  module Types
    # Job execution summary.
    class GetJobSummary < Internal::Types::Model
      field :failed, -> { Integer }, optional: true, nullable: false
      field :updated, -> { Integer }, optional: true, nullable: false
      field :inserted, -> { Integer }, optional: true, nullable: false
      field :total, -> { Integer }, optional: true, nullable: false
    end
  end
end

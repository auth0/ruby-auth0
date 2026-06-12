# frozen_string_literal: true

module Auth0
  module Types
    # A single reporting endpoint.
    class CspReportToEndpoint < Internal::Types::Model
      field :url, -> { String }, optional: true, nullable: false
    end
  end
end

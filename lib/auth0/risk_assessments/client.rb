# frozen_string_literal: true

module Auth0
  module RiskAssessments
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Auth0::Settings::Client]
      def settings
        @settings ||= Auth0::RiskAssessments::Settings::Client.new(client: @client)
      end
    end
  end
end

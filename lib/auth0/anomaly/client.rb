# frozen_string_literal: true

module Auth0
  module Anomaly
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Auth0::Blocks::Client]
      def blocks
        @blocks ||= Auth0::Anomaly::Blocks::Client.new(client: @client)
      end
    end
  end
end

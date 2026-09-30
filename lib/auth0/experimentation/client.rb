# frozen_string_literal: true

module Auth0
  module Experimentation
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Auth0::Experiments::Client]
      def experiments
        @experiments ||= Auth0::Experimentation::Experiments::Client.new(client: @client)
      end

      # @return [Auth0::FeatureFlags::Client]
      def feature_flags
        @feature_flags ||= Auth0::Experimentation::FeatureFlags::Client.new(client: @client)
      end

      # @return [Auth0::Segments::Client]
      def segments
        @segments ||= Auth0::Experimentation::Segments::Client.new(client: @client)
      end
    end
  end
end

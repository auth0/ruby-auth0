# frozen_string_literal: true

module Auth0
  module Guardian
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Auth0::Enrollments::Client]
      def enrollments
        @enrollments ||= Auth0::Guardian::Enrollments::Client.new(client: @client)
      end

      # @return [Auth0::Factors::Client]
      def factors
        @factors ||= Auth0::Guardian::Factors::Client.new(client: @client)
      end

      # @return [Auth0::Policies::Client]
      def policies
        @policies ||= Auth0::Guardian::Policies::Client.new(client: @client)
      end
    end
  end
end

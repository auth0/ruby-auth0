# frozen_string_literal: true

module Auth0
  module VerifiableCredentials
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Auth0::Verification::Client]
      def verification
        @verification ||= Auth0::VerifiableCredentials::Verification::Client.new(client: @client)
      end
    end
  end
end

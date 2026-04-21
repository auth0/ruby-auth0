# frozen_string_literal: true

module Auth0
  module Emails
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Auth0::Provider::Client]
      def provider
        @provider ||= Auth0::Emails::Provider::Client.new(client: @client)
      end
    end
  end
end

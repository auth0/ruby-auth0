# frozen_string_literal: true

module Auth0
  module Keys
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Auth0::CustomSigning::Client]
      def custom_signing
        @custom_signing ||= Auth0::Keys::CustomSigning::Client.new(client: @client)
      end

      # @return [Auth0::Encryption::Client]
      def encryption
        @encryption ||= Auth0::Keys::Encryption::Client.new(client: @client)
      end

      # @return [Auth0::Signing::Client]
      def signing
        @signing ||= Auth0::Keys::Signing::Client.new(client: @client)
      end
    end
  end
end

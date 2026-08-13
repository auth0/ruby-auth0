# frozen_string_literal: true

module Auth0
  module Flows
    module Vault
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # @return [Auth0::Connections::Client]
        def connections
          @connections ||= Auth0::Flows::Vault::Connections::Client.new(client: @client)
        end
      end
    end
  end
end

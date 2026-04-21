# frozen_string_literal: true

module Auth0
  module VerifiableCredentials
    module Verification
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # @return [Auth0::Templates::Client]
        def templates
          @templates ||= Auth0::VerifiableCredentials::Verification::Templates::Client.new(client: @client)
        end
      end
    end
  end
end

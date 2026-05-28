# frozen_string_literal: true

module Auth0
  module Users
    module EffectiveRoles
      module Sources
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # @return [Auth0::Groups::Client]
          def groups
            @groups ||= Auth0::Users::EffectiveRoles::Sources::Groups::Client.new(client: @client)
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Users
    module EffectivePermissions
      module Sources
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # @return [Auth0::Roles::Client]
          def roles
            @roles ||= Auth0::Users::EffectivePermissions::Sources::Roles::Client.new(client: @client)
          end
        end
      end
    end
  end
end

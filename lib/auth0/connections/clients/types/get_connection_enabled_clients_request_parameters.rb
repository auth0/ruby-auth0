# frozen_string_literal: true

module Auth0
  module Connections
    module Clients
      module Types
        class GetConnectionEnabledClientsRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :take, -> { Integer }, optional: true, nullable: false
          field :from, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end

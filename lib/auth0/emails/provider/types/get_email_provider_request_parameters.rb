# frozen_string_literal: true

module Auth0
  module Emails
    module Provider
      module Types
        class GetEmailProviderRequestParameters < Internal::Types::Model
          field :fields, -> { String }, optional: true, nullable: false
          field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end

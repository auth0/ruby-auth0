# frozen_string_literal: true

module Auth0
  module Actions
    module Versions
      module Types
        class ListActionVersionsRequestParameters < Internal::Types::Model
          field :action_id, -> { String }, optional: false, nullable: false, api_name: "actionId"
          field :page, -> { Integer }, optional: true, nullable: false
          field :per_page, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end

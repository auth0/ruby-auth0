# frozen_string_literal: true

module Auth0
  module Users
    module Logs
      module Types
        class ListUserLogsRequestParameters < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :page, -> { Integer }, optional: true, nullable: false
          field :per_page, -> { Integer }, optional: true, nullable: false
          field :sort, -> { String }, optional: true, nullable: false
          field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAirtableListRecordsParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :base_id, -> { String }, optional: false, nullable: false
      field :table_name, -> { String }, optional: false, nullable: false
      field :query, -> { String }, optional: true, nullable: false
      field :view, -> { String }, optional: true, nullable: false
    end
  end
end

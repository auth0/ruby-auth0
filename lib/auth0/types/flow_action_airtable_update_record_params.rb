# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionAirtableUpdateRecordParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :base_id, -> { String }, optional: false, nullable: false
      field :table_name, -> { String }, optional: false, nullable: false
      field :record_id, -> { String }, optional: false, nullable: false
      field :fields, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

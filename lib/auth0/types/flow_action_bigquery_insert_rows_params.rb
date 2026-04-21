# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionBigqueryInsertRowsParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :dataset_id, -> { String }, optional: false, nullable: false
      field :table_id, -> { String }, optional: false, nullable: false
      field :data, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

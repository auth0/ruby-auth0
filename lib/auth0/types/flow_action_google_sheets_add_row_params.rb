# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionGoogleSheetsAddRowParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :spreadsheet_id, -> { String }, optional: false, nullable: false
      field :sheet_id, -> { Auth0::Types::FlowActionGoogleSheetsAddRowParamsSheetID }, optional: true, nullable: false
      field :values, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end

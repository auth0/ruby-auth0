# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionActivecampaignUpsertContactParams < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :email, -> { String }, optional: false, nullable: false
      field :first_name, -> { String }, optional: true, nullable: false
      field :last_name, -> { String }, optional: true, nullable: false
      field :phone, -> { String }, optional: true, nullable: false
      field :custom_fields, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end

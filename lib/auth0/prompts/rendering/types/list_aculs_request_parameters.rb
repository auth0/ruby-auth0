# frozen_string_literal: true

module Auth0
  module Prompts
    module Rendering
      module Types
        class ListAculsRequestParameters < Internal::Types::Model
          field :fields, -> { String }, optional: true, nullable: false
          field :include_fields, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :page, -> { Integer }, optional: true, nullable: false
          field :per_page, -> { Integer }, optional: true, nullable: false
          field :include_totals, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :prompt, -> { String }, optional: true, nullable: false
          field :screen, -> { String }, optional: true, nullable: false
          field :rendering_mode, -> { Auth0::Types::AculRenderingModeEnum }, optional: true, nullable: false
        end
      end
    end
  end
end

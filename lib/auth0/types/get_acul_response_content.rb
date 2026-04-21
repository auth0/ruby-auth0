# frozen_string_literal: true

module Auth0
  module Types
    class GetAculResponseContent < Internal::Types::Model
      field :tenant, -> { String }, optional: true, nullable: false
      field :prompt, -> { String }, optional: true, nullable: false
      field :screen, -> { String }, optional: true, nullable: false
      field :rendering_mode, -> { Auth0::Types::AculRenderingModeEnum }, optional: true, nullable: false
      field :context_configuration, -> { Internal::Types::Array[Auth0::Types::AculContextConfigurationItem] }, optional: true, nullable: false
      field :default_head_tags_disabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :use_page_template, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :head_tags, -> { Internal::Types::Array[Auth0::Types::AculHeadTag] }, optional: true, nullable: false
      field :filters, -> { Auth0::Types::AculFilters }, optional: true, nullable: false
    end
  end
end

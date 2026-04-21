# frozen_string_literal: true

module Auth0
  module Types
    class BrandingThemeBorders < Internal::Types::Model
      field :button_border_radius, -> { Integer }, optional: false, nullable: false
      field :button_border_weight, -> { Integer }, optional: false, nullable: false
      field :buttons_style, -> { Auth0::Types::BrandingThemeBordersButtonsStyleEnum }, optional: false, nullable: false
      field :input_border_radius, -> { Integer }, optional: false, nullable: false
      field :input_border_weight, -> { Integer }, optional: false, nullable: false
      field :inputs_style, -> { Auth0::Types::BrandingThemeBordersInputsStyleEnum }, optional: false, nullable: false
      field :show_widget_shadow, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :widget_border_weight, -> { Integer }, optional: false, nullable: false
      field :widget_corner_radius, -> { Integer }, optional: false, nullable: false
    end
  end
end

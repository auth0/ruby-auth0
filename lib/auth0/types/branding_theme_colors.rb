# frozen_string_literal: true

module Auth0
  module Types
    class BrandingThemeColors < Internal::Types::Model
      field :base_focus_color, -> { String }, optional: true, nullable: false
      field :base_hover_color, -> { String }, optional: true, nullable: false
      field :body_text, -> { String }, optional: false, nullable: false
      field :captcha_widget_theme, -> { Auth0::Types::BrandingThemeColorsCaptchaWidgetThemeEnum }, optional: true, nullable: false
      field :error, -> { String }, optional: false, nullable: false
      field :header, -> { String }, optional: false, nullable: false
      field :icons, -> { String }, optional: false, nullable: false
      field :input_background, -> { String }, optional: false, nullable: false
      field :input_border, -> { String }, optional: false, nullable: false
      field :input_filled_text, -> { String }, optional: false, nullable: false
      field :input_labels_placeholders, -> { String }, optional: false, nullable: false
      field :links_focused_components, -> { String }, optional: false, nullable: false
      field :primary_button, -> { String }, optional: false, nullable: false
      field :primary_button_label, -> { String }, optional: false, nullable: false
      field :read_only_background, -> { String }, optional: true, nullable: false
      field :secondary_button_border, -> { String }, optional: false, nullable: false
      field :secondary_button_label, -> { String }, optional: false, nullable: false
      field :success, -> { String }, optional: false, nullable: false
      field :widget_background, -> { String }, optional: false, nullable: false
      field :widget_border, -> { String }, optional: false, nullable: false
    end
  end
end

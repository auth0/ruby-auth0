# frozen_string_literal: true

module Auth0
  module Types
    # Integration defines a self contained functioning unit which partners
    # publish. A partner may create one or many of these integrations.
    class Integration < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :catalog_id, -> { String }, optional: true, nullable: false
      field :url_slug, -> { String }, optional: true, nullable: false
      field :partner_id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :short_description, -> { String }, optional: true, nullable: false
      field :logo, -> { String }, optional: true, nullable: false
      field :feature_type, -> { Auth0::Types::IntegrationFeatureTypeEnum }, optional: true, nullable: false
      field :terms_of_use_url, -> { String }, optional: true, nullable: false
      field :privacy_policy_url, -> { String }, optional: true, nullable: false
      field :public_support_link, -> { String }, optional: true, nullable: false
      field :current_release, -> { Auth0::Types::IntegrationRelease }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end

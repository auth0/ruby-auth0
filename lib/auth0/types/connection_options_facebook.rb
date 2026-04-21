# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'facebook' connection
    class ConnectionOptionsFacebook < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :freeform_scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :scope, -> { String }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :ads_management, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ads_read, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :allow_context_profile_field, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :business_management, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :email, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :groups_access_member_info, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :leads_retrieval, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :manage_notifications, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :manage_pages, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :pages_manage_cta, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :pages_manage_instant_articles, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :pages_messaging, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :pages_messaging_phone_number, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :pages_messaging_subscriptions, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :pages_show_list, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :public_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :publish_actions, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :publish_pages, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :publish_to_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :publish_video, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_audience_network_insights, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_insights, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_mailbox, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_page_mailboxes, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :read_stream, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_age_range, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_birthday, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_events, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_friends, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_gender, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_hometown, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_likes, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_link, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_location, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_managed_groups, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_photos, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_posts, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_status, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_tagged_places, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_videos, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

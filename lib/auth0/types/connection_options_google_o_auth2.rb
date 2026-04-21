# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'google-oauth2' connection
    class ConnectionOptionsGoogleOAuth2 < Internal::Types::Model
      field :allowed_audiences, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :freeform_scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :icon_url, -> { String }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :adsense_management, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :analytics, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :blogger, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :calendar, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :calendar_addons_execute, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :calendar_events, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :calendar_events_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :calendar_settings_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :chrome_web_store, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts_new, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts_other_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :content_api_for_shopping, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :coordinate, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :coordinate_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :directory_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :document_list, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_activity, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_activity_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_appdata, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_apps_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_file, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_metadata_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_photos_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :drive_scripts, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :email, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_compose, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_insert, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_labels, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_modify, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_new, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_send, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_settings_basic, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :gmail_settings_sharing, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :google_affiliate_network, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :google_books, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :google_cloud_storage, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :google_drive, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :google_drive_files, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :google_plus, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :latitude_best, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :latitude_city, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :moderator, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :offline_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :orkut, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :picasa_web, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :sites, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :tasks, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :tasks_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :url_shortener, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :webmaster_tools, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :youtube, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :youtube_channelmemberships_creator, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :youtube_new, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :youtube_readonly, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :youtube_upload, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :youtubepartner, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

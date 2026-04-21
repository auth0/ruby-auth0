# frozen_string_literal: true

module Auth0
  module Types
    # Options for the 'windowslive' connection
    class ConnectionOptionsWindowsLive < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false
      field :client_secret, -> { String }, optional: true, nullable: false
      field :freeform_scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :scope, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :set_user_root_attributes, -> { Auth0::Types::ConnectionSetUserRootAttributesEnum }, optional: true, nullable: false
      field :strategy_version, -> { Integer }, optional: true, nullable: false
      field :upstream_params, -> { Internal::Types::Hash[String, Auth0::Types::ConnectionUpstreamAdditionalProperties] }, optional: true, nullable: false
      field :applications, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :applications_create, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :basic, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :birthday, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :calendars, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :calendars_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts_birthday, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts_calendars, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts_create, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts_photos, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :contacts_skydrive, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :directory_accessasuser_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :directory_read_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :directory_readwrite_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :emails, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :events_create, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_calendars, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_calendars_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_contacts, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_contacts_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_device, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_device_command, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_emails, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_emails_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_files, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_files_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_files_all_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_files_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_notes, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_notes_create, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_notes_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_tasks, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_tasks_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_user, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_user_activity, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :graph_user_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :group_read_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :group_readwrite_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mail_readwrite_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mail_send, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :messenger, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :offline_access, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :phone_numbers, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :photos, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :postal_addresses, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :rolemanagement_read_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :rolemanagement_readwrite_directory, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :share, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :signin, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :sites_read_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :sites_readwrite_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :skydrive, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :skydrive_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :team_readbasic_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :team_readwrite_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_read_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :user_readbasic_all, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :work_profile, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end

module Auth0
  module Api
    module V2
      # Methods to use the device crenditials endpoints
      module DeviceCredentials
        attr_reader :device_credentials_path

        # Retrieves log entries that match the specified search criteria.
        # @see https://auth0.com/docs/api/v2#!/device_credentials/get_device_credentials
        # @param fields [string] A comma separated list of fields to include or exclude from the result.
        # @param include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        # @param user_id [string] The user_id of the devices to retrieve.
        # @param client_id [string] The client_id of the devices to retrieve.
        # @param type [string] The type of credentials. Possible values: 'public_key' or 'refresh_token'.
        #
        # @return [json] Returns the list of existing devices for the specified client_id.
        # rubocop:disable Metrics/AbcSize
        def device_credentials(client_id, options = {})
          request_params = {
            fields: options.fetch(:fields, nil),
            include_fields: options.fetch(:include_fields, nil),
            user_id: options.fetch(:user_id, nil),
            client_id: client_id,
            type: options.fetch(:type, nil)
          }
          raise Auth0::InvalidParameter, 'Must supply a valid client_id' if client_id.to_s.empty?
          if !request_params[:type].nil? && !%w(public_key refresh_token).include?(request_params[:type])
            raise Auth0::InvalidParameter, 'Type must be one of \'public_key\', \'refresh_token\''
          end
          get(device_credentials_path, request_params)
        end
        alias list_device_credentials device_credentials

        # Creates a new device public key.
        # @see https://auth0.com/docs/api/v2#!/device_credentials/post_device_credentials
        # @param device_name [string] The device's name, a value that must be easily recognized by the device's owner.
        # @param value [string] A base64 encoded string with the value of the credential.
        # @param device_id [string] A unique identifier for the device.
        # @param client_id [string] The client_id of the client for which the credential will be created.
        #
        # @return [json] Returns the created public key.
        def create_device_credential(device_name, value, device_id, client_id)
          raise Auth0::InvalidParameter, 'Must supply a valid device_name' if device_name.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid value' if value.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid device_id' if device_id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid client_id' if client_id.to_s.empty?
          request_params = {
            device_name:  device_name,
            type:         'public_key',
            value:        value,
            device_id:    device_id,
            client_id:    client_id
          }
          post(device_credentials_path, request_params)
        end
        alias create_device_public_key create_device_credential

        # Deletes a single device credential given its id.
        # @see https://auth0.com/docs/api/v2#!/device_credentials/delete_device_credentials_by_id
        # @param id [string] The id of the credential to delete.
        def delete_device_credential(id)
          raise Auth0::InvalidParameter, 'Must supply a valid id' if id.to_s.empty?
          path = "#{device_credentials_path}/#{id}"
          delete(path)
        end

        private

        # Device Credentials API path
        def device_credentials_path
          @device_credentials_path ||= '/api/v2/device-credentials'
        end
      end
    end
  end
end

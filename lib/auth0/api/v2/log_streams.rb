module Auth0
  module Api
    module V2
      # Methods to use the log streams endpoints
      module LogStreams
        attr_reader :log_streams_path

        # Retrieves a list of all log streams.
        # @see https://auth0.com/docs/api/management/v2#!/Log_Streams/get_log_streams
        # @return [json] Returns the log streams.
        def log_streams()
          get(log_streams_path)
        end
        alias get_log_streams log_streams

        # Retrieves a log stream by its ID.
        # @see https://auth0.com/docs/api/management/v2#!/Log_Streams/get_log_streams_by_id
        # @param id [string] The id of the log stream to retrieve.
        #
        # @return [json] Returns the log stream.
        def log_stream(id)
          raise Auth0::InvalidParameter, 'Must supply a valid log stream id' if id.to_s.empty?
          path = "#{log_streams_path}/#{id}"
          get(path)
        end
        alias get_log_stream log_stream

        # Creates a new log stream according to the JSON object received in body.
        # @see https://auth0.com/docs/api/management/v2#!/Log_Streams/post_log_streams
        # @param name [string] The name of the log stream.
        # @param type [string] The type of log stream
        # @param options [hash] The Hash options used to define the log streams's properties.
        #
        # @return [json] Returns the log stream.
        def create_log_stream(name, type, options)
          raise Auth0::InvalidParameter, 'Name must contain at least one character' if name.to_s.empty?
          raise Auth0::InvalidParameter, 'Must specify a valid type' if type.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid hash for options' unless options.is_a? Hash

          request_params = {}
          request_params[:name] = name
          request_params[:type] = type
          request_params[:sink] = options
          post(log_streams_path, request_params)
        end

        # Deletes a log stream by its ID.
        # @see https://auth0.com/docs/api/management/v2#!/Log_Streams/delete_log_streams_by_id
        # @param id [string] The id of the log stream to delete.
        def delete_log_stream(id)
          raise Auth0::InvalidParameter, 'Must supply a valid log stream id' if id.to_s.empty?
          path = "#{log_streams_path}/#{id}"
          delete(path)
        end

        # Updates a log stream.
        # @see https://auth0.com/docs/api/management/v2#!/Log_Streams/patch_log_streams_by_id
        # @param id [string] The id or audience of the log stream to update.
        # @param status [string] The Hash options used to define the log streams's properties.
        def patch_log_stream(id, status)
          raise Auth0::InvalidParameter, 'Must specify a log stream id' if id.to_s.empty?
          raise Auth0::InvalidParameter, 'Must specify a valid status' if status.to_s.empty?

          request_params = {}
          request_params[:status] = status
          path = "#{log_streams_path}/#{id}"
          patch(path, request_params)
        end
        
        private
        # Log Streams API path
        def log_streams_path
          @log_streams_path ||= '/api/v2/log-streams'
        end
      end
    end
  end
end

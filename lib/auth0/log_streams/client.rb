# frozen_string_literal: true

module Auth0
  module LogStreams
    class Client
      # @param client [Auth0::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve details on [log streams](https://auth0.com/docs/logs/streams).
      #
      # **Sample Response**
      #
      # ```json
      # [{
      #   "id": "string",
      #   "name": "string",
      #   "type": "eventbridge",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "awsAccountId": "string",
      #     "awsRegion": "string",
      #     "awsPartnerEventSource": "string"
      #   }
      # }, {
      #   "id": "string",
      #   "name": "string",
      #   "type": "http",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "httpContentFormat": "JSONLINES|JSONARRAY",
      #     "httpContentType": "string",
      #     "httpEndpoint": "string",
      #     "httpAuthorization": "string"
      #   }
      # },
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "eventgrid",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "azureSubscriptionId": "string",
      #     "azureResourceGroup": "string",
      #     "azureRegion": "string",
      #     "azurePartnerTopic": "string"
      #   }
      # },
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "splunk",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "splunkDomain": "string",
      #     "splunkToken": "string",
      #     "splunkPort": "string",
      #     "splunkSecure": "boolean"
      #   }
      # },
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "sumo",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "sumoSourceAddress": "string"
      #   }
      # },
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "datadog",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "datadogRegion": "string",
      #     "datadogApiKey": "string"
      #   }
      # }]
      # ```
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Array[Auth0::Types::LogStreamResponseSchema]]
      def list(request_options: {}, **_params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "log-streams",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Create a log stream.
      #
      # **Log Stream Types**
      #
      # The `type` of log stream being created determines the properties required in the `sink` payload.
      #
      # **HTTP Stream**
      #
      # For an `http` Stream, the `sink` properties are listed in the payload below.
      #
      # **Request:**
      # ```json
      # {
      #   "name": "string",
      #   "type": "http",
      #   "sink": {
      #     "httpEndpoint": "string",
      #     "httpContentType": "string",
      #     "httpContentFormat": "JSONLINES|JSONARRAY",
      #     "httpAuthorization": "string"
      #   }
      # }
      # ```
      #
      # **Response:**
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "http",
      #   "status": "active",
      #   "sink": {
      #     "httpEndpoint": "string",
      #     "httpContentType": "string",
      #     "httpContentFormat": "JSONLINES|JSONARRAY",
      #     "httpAuthorization": "string"
      #   }
      # }
      # ```
      #
      # **Amazon EventBridge Stream**
      #
      # For an `eventbridge` Stream, the `sink` properties are listed in the payload below.
      #
      # **Request:**
      # ```json
      # {
      #   "name": "string",
      #   "type": "eventbridge",
      #   "sink": {
      #     "awsRegion": "string",
      #     "awsAccountId": "string"
      #   }
      # }
      # ```
      #
      # The response will include an additional field `awsPartnerEventSource` in the `sink`:
      #
      # **Response:**
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "eventbridge",
      #   "status": "active",
      #   "sink": {
      #     "awsAccountId": "string",
      #     "awsRegion": "string",
      #     "awsPartnerEventSource": "string"
      #   }
      # }
      # ```
      #
      # **Azure Event Grid Stream**
      #
      # For an `Azure Event Grid` Stream, the `sink` properties are listed in the payload below.
      #
      # **Request:**
      # ```json
      # {
      #   "name": "string",
      #   "type": "eventgrid",
      #   "sink": {
      #     "azureSubscriptionId": "string",
      #     "azureResourceGroup": "string",
      #     "azureRegion": "string"
      #   }
      # }
      # ```
      #
      # **Response:**
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "http",
      #   "status": "active",
      #   "sink": {
      #     "azureSubscriptionId": "string",
      #     "azureResourceGroup": "string",
      #     "azureRegion": "string",
      #     "azurePartnerTopic": "string"
      #   }
      # }
      # ```
      #
      # **Datadog Stream**
      #
      # For a `Datadog` Stream, the `sink` properties are listed in the payload below.
      #
      # **Request:**
      # ```json
      # {
      #   "name": "string",
      #   "type": "datadog",
      #   "sink": {
      #     "datadogRegion": "string",
      #     "datadogApiKey": "string"
      #   }
      # }
      # ```
      #
      # **Response:**
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "datadog",
      #   "status": "active",
      #   "sink": {
      #     "datadogRegion": "string",
      #     "datadogApiKey": "string"
      #   }
      # }
      # ```
      #
      # **Splunk Stream**
      #
      # For a `Splunk` Stream, the `sink` properties are listed in the payload below.
      #
      # **Request:**
      # ```json
      # {
      #   "name": "string",
      #   "type": "splunk",
      #   "sink": {
      #     "splunkDomain": "string",
      #     "splunkToken": "string",
      #     "splunkPort": "string",
      #     "splunkSecure": "boolean"
      #   }
      # }
      # ```
      #
      # **Response:**
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "splunk",
      #   "status": "active",
      #   "sink": {
      #     "splunkDomain": "string",
      #     "splunkToken": "string",
      #     "splunkPort": "string",
      #     "splunkSecure": "boolean"
      #   }
      # }
      # ```
      #
      # **Sumo Logic Stream**
      #
      # For a `Sumo Logic` Stream, the `sink` properties are listed in the payload below.
      #
      # **Request:**
      # ```json
      # {
      #   "name": "string",
      #   "type": "sumo",
      #   "sink": {
      #     "sumoSourceAddress": "string"
      #   }
      # }
      # ```
      #
      # **Response:**
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "sumo",
      #   "status": "active",
      #   "sink": {
      #     "sumoSourceAddress": "string"
      #   }
      # }
      # ```
      #
      # @param request_options [Hash]
      # @param params [Auth0::Types::CreateLogStreamRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Auth0::Types::CreateLogStreamResponseContent]
      def create(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "log-streams",
          body: Auth0::Types::CreateLogStreamRequestContent.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::CreateLogStreamResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve a log stream configuration and status.
      #
      # **Sample responses**
      #
      # **Amazon EventBridge Log Stream**
      #
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "eventbridge",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "awsAccountId": "string",
      #     "awsRegion": "string",
      #     "awsPartnerEventSource": "string"
      #   }
      # }
      # ```
      #
      # **HTTP Log Stream**
      #
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "http",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "httpContentFormat": "JSONLINES|JSONARRAY",
      #     "httpContentType": "string",
      #     "httpEndpoint": "string",
      #     "httpAuthorization": "string"
      #   }
      # }
      # ```
      #
      # **Datadog Log Stream**
      #
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "datadog",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "datadogRegion": "string",
      #     "datadogApiKey": "string"
      #   }
      # }
      # ```
      #
      # **Mixpanel**
      #
      # **Request:**
      #
      # ```json
      # {
      #   "name": "string",
      #   "type": "mixpanel",
      #   "sink": {
      #     "mixpanelRegion": "string",
      #     "mixpanelProjectId": "string",
      #     "mixpanelServiceAccountUsername": "string",
      #     "mixpanelServiceAccountPassword": "string"
      #   }
      # }
      # ```
      #
      # **Response:**
      #
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "mixpanel",
      #   "status": "active",
      #   "sink": {
      #     "mixpanelRegion": "string",
      #     "mixpanelProjectId": "string",
      #     "mixpanelServiceAccountUsername": "string",
      #     "mixpanelServiceAccountPassword": "string"
      #   }
      # }
      # ```
      #
      # **Segment**
      #
      # **Request:**
      #
      # ```json
      # {
      #   "name": "string",
      #   "type": "segment",
      #   "sink": {
      #     "segmentWriteKey": "string"
      #   }
      # }
      # ```
      #
      # **Response:**
      #
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "segment",
      #   "status": "active",
      #   "sink": {
      #     "segmentWriteKey": "string"
      #   }
      # }
      # ```
      #
      # **Splunk Log Stream**
      #
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "splunk",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "splunkDomain": "string",
      #     "splunkToken": "string",
      #     "splunkPort": "string",
      #     "splunkSecure": "boolean"
      #   }
      # }
      # ```
      #
      # **Sumo Logic Log Stream**
      #
      # ```json
      # {
      #   "id": "string",
      #   "name": "string",
      #   "type": "sumo",
      #   "status": "active|paused|suspended",
      #   "sink": {
      #     "sumoSourceAddress": "string"
      #   }
      # }
      # ```
      #
      # **Status**
      #
      # The `status` of a log stream maybe any of the following:
      #
      # 1. `active` - Stream is currently enabled.
      # 2. `paused` - Stream is currently user disabled and will not attempt log delivery.
      # 3. `suspended` - Stream is currently disabled because of errors and will not attempt log delivery.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Auth0::Types::GetLogStreamResponseContent]
      def get(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "log-streams/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::GetLogStreamResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a log stream.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "log-streams/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Update a log stream.
      #
      # **Examples of how to use the PATCH endpoint.**
      #
      # The following fields may be updated in a PATCH operation:
      #
      # - name
      # - status
      # - sink
      #
      # Note: For log streams of type `eventbridge` and `eventgrid`, updating the `sink` is not permitted.
      #
      # **Update the status of a log stream**
      #
      # ```json
      # {
      #   "status": "active|paused"
      # }
      # ```
      #
      # **Update the name of a log stream**
      #
      # ```json
      # {
      #   "name": "string"
      # }
      # ```
      #
      # **Update the sink properties of a stream of type `http`**
      #
      # ```json
      # {
      #   "sink": {
      #     "httpEndpoint": "string",
      #     "httpContentType": "string",
      #     "httpContentFormat": "JSONARRAY|JSONLINES",
      #     "httpAuthorization": "string"
      #   }
      # }
      # ```
      #
      # **Update the sink properties of a stream of type `datadog`**
      #
      # ```json
      # {
      #   "sink": {
      #     "datadogRegion": "string",
      #     "datadogApiKey": "string"
      #   }
      # }
      # ```
      #
      # **Update the sink properties of a stream of type `splunk`**
      #
      # ```json
      # {
      #   "sink": {
      #     "splunkDomain": "string",
      #     "splunkToken": "string",
      #     "splunkPort": "string",
      #     "splunkSecure": "boolean"
      #   }
      # }
      # ```
      #
      # **Update the sink properties of a stream of type `sumo`**
      #
      # ```json
      # {
      #   "sink": {
      #     "sumoSourceAddress": "string"
      #   }
      # }
      # ```
      #
      # @param request_options [Hash]
      # @param params [Auth0::LogStreams::Types::UpdateLogStreamRequestContent]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Auth0::Types::UpdateLogStreamResponseContent]
      def update(request_options: {}, **params)
        params = Auth0::Internal::Types::Utils.normalize_keys(params)
        request_data = Auth0::LogStreams::Types::UpdateLogStreamRequestContent.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Auth0::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "log-streams/#{URI.encode_uri_component(params[:id].to_s)}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Auth0::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Auth0::Types::UpdateLogStreamResponseContent.load(response.body)
        else
          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end

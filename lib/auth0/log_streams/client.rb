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

      # Retrieve details on <a href="https://auth0.com/docs/logs/streams">log streams</a>.
      # <h5>Sample Response</h5><pre><code>[{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "eventbridge",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"awsAccountId": "string",
      # 		"awsRegion": "string",
      # 		"awsPartnerEventSource": "string"
      # 	}
      # }, {
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "http",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"httpContentFormat": "JSONLINES|JSONARRAY",
      # 		"httpContentType": "string",
      # 		"httpEndpoint": "string",
      # 		"httpAuthorization": "string"
      # 	}
      # },
      # {
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "eventgrid",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"azureSubscriptionId": "string",
      # 		"azureResourceGroup": "string",
      # 		"azureRegion": "string",
      # 		"azurePartnerTopic": "string"
      # 	}
      # },
      # {
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "splunk",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"splunkDomain": "string",
      # 		"splunkToken": "string",
      # 		"splunkPort": "string",
      # 		"splunkSecure": "boolean"
      # 	}
      # },
      # {
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "sumo",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"sumoSourceAddress": "string",
      # 	}
      # },
      # {
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "datadog",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"datadogRegion": "string",
      # 		"datadogApiKey": "string"
      # 	}
      # }]</code></pre>
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Array[Auth0::Types::LogStreamResponseSchema]]
      def list(request_options: {}, **params)
        Auth0::Internal::Types::Utils.normalize_keys(params)
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
      # <h5>Log Stream Types</h5> The <code>type</code> of log stream being created determines the properties required
      # in the <code>sink</code> payload.
      # <h5>HTTP Stream</h5> For an <code>http</code> Stream, the <code>sink</code> properties are listed in the payload
      # below
      # Request: <pre><code>{
      # 	"name": "string",
      # 	"type": "http",
      # 	"sink": {
      # 		"httpEndpoint": "string",
      # 		"httpContentType": "string",
      # 		"httpContentFormat": "JSONLINES|JSONARRAY",
      # 		"httpAuthorization": "string"
      # 	}
      # }</code></pre>
      # Response: <pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "http",
      # 	"status": "active",
      # 	"sink": {
      # 		"httpEndpoint": "string",
      # 		"httpContentType": "string",
      # 		"httpContentFormat": "JSONLINES|JSONARRAY",
      # 		"httpAuthorization": "string"
      # 	}
      # }</code></pre>
      # <h5>Amazon EventBridge Stream</h5> For an <code>eventbridge</code> Stream, the <code>sink</code> properties are
      # listed in the payload below
      # Request: <pre><code>{
      # 	"name": "string",
      # 	"type": "eventbridge",
      # 	"sink": {
      # 		"awsRegion": "string",
      # 		"awsAccountId": "string"
      # 	}
      # }</code></pre>
      # The response will include an additional field <code>awsPartnerEventSource</code> in the <code>sink</code>:
      # <pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "eventbridge",
      # 	"status": "active",
      # 	"sink": {
      # 		"awsAccountId": "string",
      # 		"awsRegion": "string",
      # 		"awsPartnerEventSource": "string"
      # 	}
      # }</code></pre>
      # <h5>Azure Event Grid Stream</h5> For an <code>Azure Event Grid</code> Stream, the <code>sink</code> properties
      # are listed in the payload below
      # Request: <pre><code>{
      # 	"name": "string",
      # 	"type": "eventgrid",
      # 	"sink": {
      # 		"azureSubscriptionId": "string",
      # 		"azureResourceGroup": "string",
      # 		"azureRegion": "string"
      # 	}
      # }</code></pre>
      # Response: <pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "http",
      # 	"status": "active",
      # 	"sink": {
      # 		"azureSubscriptionId": "string",
      # 		"azureResourceGroup": "string",
      # 		"azureRegion": "string",
      # 		"azurePartnerTopic": "string"
      # 	}
      # }</code></pre>
      # <h5>Datadog Stream</h5> For a <code>Datadog</code> Stream, the <code>sink</code> properties are listed in the
      # payload below
      # Request: <pre><code>{
      # 	"name": "string",
      # 	"type": "datadog",
      # 	"sink": {
      # 		"datadogRegion": "string",
      # 		"datadogApiKey": "string"
      # 	}
      # }</code></pre>
      # Response: <pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "datadog",
      # 	"status": "active",
      # 	"sink": {
      # 		"datadogRegion": "string",
      # 		"datadogApiKey": "string"
      # 	}
      # }</code></pre>
      # <h5>Splunk Stream</h5> For a <code>Splunk</code> Stream, the <code>sink</code> properties are listed in the
      # payload below
      # Request: <pre><code>{
      # 	"name": "string",
      # 	"type": "splunk",
      # 	"sink": {
      # 		"splunkDomain": "string",
      # 		"splunkToken": "string",
      # 		"splunkPort": "string",
      # 		"splunkSecure": "boolean"
      # 	}
      # }</code></pre>
      # Response: <pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "splunk",
      # 	"status": "active",
      # 	"sink": {
      # 		"splunkDomain": "string",
      # 		"splunkToken": "string",
      # 		"splunkPort": "string",
      # 		"splunkSecure": "boolean"
      # 	}
      # }</code></pre>
      # <h5>Sumo Logic Stream</h5> For a <code>Sumo Logic</code> Stream, the <code>sink</code> properties are listed in
      # the payload below
      # Request: <pre><code>{
      # 	"name": "string",
      # 	"type": "sumo",
      # 	"sink": {
      # 		"sumoSourceAddress": "string",
      # 	}
      # }</code></pre>
      # Response: <pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "sumo",
      # 	"status": "active",
      # 	"sink": {
      # 		"sumoSourceAddress": "string",
      # 	}
      # }</code></pre>
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
      # <h5>Sample responses</h5><h5>Amazon EventBridge Log Stream</h5><pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "eventbridge",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"awsAccountId": "string",
      # 		"awsRegion": "string",
      # 		"awsPartnerEventSource": "string"
      # 	}
      # }</code></pre> <h5>HTTP Log Stream</h5><pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "http",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"httpContentFormat": "JSONLINES|JSONARRAY",
      # 		"httpContentType": "string",
      # 		"httpEndpoint": "string",
      # 		"httpAuthorization": "string"
      # 	}
      # }</code></pre> <h5>Datadog Log Stream</h5><pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "datadog",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"datadogRegion": "string",
      # 		"datadogApiKey": "string"
      # 	}
      #
      # }</code></pre><h5>Mixpanel</h5>
      #
      # 	Request: <pre><code>{
      # 	  "name": "string",
      # 	  "type": "mixpanel",
      # 	  "sink": {
      # 		"mixpanelRegion": "string", // "us" | "eu",
      # 		"mixpanelProjectId": "string",
      # 		"mixpanelServiceAccountUsername": "string",
      # 		"mixpanelServiceAccountPassword": "string"
      # 	  }
      # 	} </code></pre>
      #
      #
      # 	Response: <pre><code>{
      # 		"id": "string",
      # 		"name": "string",
      # 		"type": "mixpanel",
      # 		"status": "active",
      # 		"sink": {
      # 		  "mixpanelRegion": "string", // "us" | "eu",
      # 		  "mixpanelProjectId": "string",
      # 		  "mixpanelServiceAccountUsername": "string",
      # 		  "mixpanelServiceAccountPassword": "string" // the following is redacted on return
      # 		}
      # 	  } </code></pre>
      #
      # 	<h5>Segment</h5>
      #
      # 	Request: <pre><code> {
      # 	  "name": "string",
      # 	  "type": "segment",
      # 	  "sink": {
      # 		"segmentWriteKey": "string"
      # 	  }
      # 	}</code></pre>
      #
      # 	Response: <pre><code>{
      # 	  "id": "string",
      # 	  "name": "string",
      # 	  "type": "segment",
      # 	  "status": "active",
      # 	  "sink": {
      # 		"segmentWriteKey": "string"
      # 	  }
      # 	} </code></pre>
      #
      # <h5>Splunk Log Stream</h5><pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "splunk",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"splunkDomain": "string",
      # 		"splunkToken": "string",
      # 		"splunkPort": "string",
      # 		"splunkSecure": "boolean"
      # 	}
      # }</code></pre> <h5>Sumo Logic Log Stream</h5><pre><code>{
      # 	"id": "string",
      # 	"name": "string",
      # 	"type": "sumo",
      # 	"status": "active|paused|suspended",
      # 	"sink": {
      # 		"sumoSourceAddress": "string",
      # 	}
      # }</code></pre> <h5>Status</h5> The <code>status</code> of a log stream maybe any of the following:
      # 1. <code>active</code> - Stream is currently enabled.
      # 2. <code>paused</code> - Stream is currently user disabled and will not attempt log delivery.
      # 3. <code>suspended</code> - Stream is currently disabled because of errors and will not attempt log delivery.
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
      # <h4>Examples of how to use the PATCH endpoint.</h4> The following fields may be updated in a PATCH operation:
      # <ul><li>name</li><li>status</li><li>sink</li></ul> Note: For log streams of type <code>eventbridge</code> and
      # <code>eventgrid</code>, updating the <code>sink</code> is not permitted.
      # <h5>Update the status of a log stream</h5><pre><code>{
      # 	"status": "active|paused"
      # }</code></pre>
      # <h5>Update the name of a log stream</h5><pre><code>{
      # 	"name": "string"
      # }</code></pre>
      # <h5>Update the sink properties of a stream of type <code>http</code></h5><pre><code>{
      #   "sink": {
      #     "httpEndpoint": "string",
      #     "httpContentType": "string",
      #     "httpContentFormat": "JSONARRAY|JSONLINES",
      #     "httpAuthorization": "string"
      #   }
      # }</code></pre>
      # <h5>Update the sink properties of a stream of type <code>datadog</code></h5><pre><code>{
      #   "sink": {
      # 		"datadogRegion": "string",
      # 		"datadogApiKey": "string"
      #   }
      # }</code></pre>
      # <h5>Update the sink properties of a stream of type <code>splunk</code></h5><pre><code>{
      #   "sink": {
      #     "splunkDomain": "string",
      #     "splunkToken": "string",
      #     "splunkPort": "string",
      #     "splunkSecure": "boolean"
      #   }
      # }</code></pre>
      # <h5>Update the sink properties of a stream of type <code>sumo</code></h5><pre><code>{
      #   "sink": {
      #     "sumoSourceAddress": "string"
      #   }
      # }</code></pre>
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
        non_body_param_names = ["id"]
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

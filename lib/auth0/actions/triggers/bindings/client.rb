# frozen_string_literal: true

module Auth0
  module Actions
    module Triggers
      module Bindings
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Retrieve the actions that are bound to a trigger. Once an action is created and deployed, it must be
          # attached (i.e. bound) to a trigger so that it will be executed as part of a flow. The list of actions
          # returned reflects the order in which they will be executed during the appropriate flow.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Auth0::Types::ActionTriggerTypeEnum] :trigger_id
          # @option params [Integer, nil] :page
          # @option params [Integer, nil] :per_page
          #
          # @return [Auth0::Types::ListActionBindingsPaginatedResponseContent]
          def list(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[page per_page]
            query_params = {}
            query_params["page"] = params.fetch(:page, 0)
            query_params["per_page"] = params.fetch(:per_page, 50)
            params = params.except(*query_param_names)

            Auth0::Internal::OffsetItemIterator.new(
              initial_page: query_params["page"],
              item_field: :bindings,
              has_next_field: nil,
              step: true
            ) do |next_page|
              query_params["page"] = next_page
              request = Auth0::Internal::JSON::Request.new(
                base_url: request_options[:base_url],
                method: "GET",
                path: "actions/triggers/#{URI.encode_uri_component(params[:trigger_id].to_s)}/bindings",
                query: query_params,
                request_options: request_options
              )
              begin
                response = @client.send(request)
              rescue Net::HTTPRequestTimeout
                raise Auth0::Errors::TimeoutError
              end
              code = response.code.to_i
              if code.between?(200, 299)
                Auth0::Types::ListActionBindingsPaginatedResponseContent.load(response.body)
              else
                error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
                raise error_class.new(response.body, code: code)
              end
            end
          end

          # Update the actions that are bound (i.e. attached) to a trigger. Once an action is created and deployed, it
          # must be attached (i.e. bound) to a trigger so that it will be executed as part of a flow. The order in which
          # the actions are provided will determine the order in which they are executed.
          #
          # @param request_options [Hash]
          # @param params [Auth0::Actions::Triggers::Bindings::Types::UpdateActionBindingsRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Auth0::Types::ActionTriggerTypeEnum] :trigger_id
          #
          # @return [Auth0::Types::UpdateActionBindingsResponseContent]
          def update_many(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request_data = Auth0::Actions::Triggers::Bindings::Types::UpdateActionBindingsRequestContent.new(params).to_h
            non_body_param_names = ["triggerId"]
            body = request_data.except(*non_body_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "actions/triggers/#{URI.encode_uri_component(params[:trigger_id].to_s)}/bindings",
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
              Auth0::Types::UpdateActionBindingsResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module Auth0
  module VerifiableCredentials
    module Verification
      module Templates
        class Client
          # @param client [Auth0::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # List a verifiable credential templates.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String, nil] :from
          # @option params [Integer, nil] :take
          #
          # @return [Auth0::Types::ListVerifiableCredentialTemplatesPaginatedResponseContent]
          def list(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[from take]
            query_params = {}
            query_params["from"] = params[:from] if params.key?(:from)
            query_params["take"] = params.fetch(:take, 50)
            params.except(*query_param_names)

            Auth0::Internal::CursorItemIterator.new(
              cursor_field: :next_,
              item_field: :templates,
              initial_cursor: query_params["from"]
            ) do |next_cursor|
              query_params["from"] = next_cursor
              request = Auth0::Internal::JSON::Request.new(
                base_url: request_options[:base_url],
                method: "GET",
                path: "verifiable-credentials/verification/templates",
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
                Auth0::Types::ListVerifiableCredentialTemplatesPaginatedResponseContent.load(response.body)
              else
                error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
                raise error_class.new(response.body, code: code)
              end
            end
          end

          # Create a verifiable credential template.
          #
          # @param request_options [Hash]
          # @param params [Auth0::VerifiableCredentials::Verification::Templates::Types::CreateVerifiableCredentialTemplateRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Auth0::Types::CreateVerifiableCredentialTemplateResponseContent]
          def create(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "verifiable-credentials/verification/templates",
              body: Auth0::VerifiableCredentials::Verification::Templates::Types::CreateVerifiableCredentialTemplateRequestContent.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::CreateVerifiableCredentialTemplateResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Get a verifiable credential template.
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
          # @return [Auth0::Types::GetVerifiableCredentialTemplateResponseContent]
          def get(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "verifiable-credentials/verification/templates/#{URI.encode_uri_component(params[:id].to_s)}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Auth0::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Auth0::Types::GetVerifiableCredentialTemplateResponseContent.load(response.body)
            else
              error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Delete a verifiable credential template.
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
              path: "verifiable-credentials/verification/templates/#{URI.encode_uri_component(params[:id].to_s)}",
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

          # Update a verifiable credential template.
          #
          # @param request_options [Hash]
          # @param params [Auth0::VerifiableCredentials::Verification::Templates::Types::UpdateVerifiableCredentialTemplateRequestContent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :id
          #
          # @return [Auth0::Types::UpdateVerifiableCredentialTemplateResponseContent]
          def update(request_options: {}, **params)
            params = Auth0::Internal::Types::Utils.normalize_keys(params)
            request_data = Auth0::VerifiableCredentials::Verification::Templates::Types::UpdateVerifiableCredentialTemplateRequestContent.new(params).to_h
            non_body_param_names = ["id"]
            body = request_data.except(*non_body_param_names)

            request = Auth0::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "PATCH",
              path: "verifiable-credentials/verification/templates/#{URI.encode_uri_component(params[:id].to_s)}",
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
              Auth0::Types::UpdateVerifiableCredentialTemplateResponseContent.load(response.body)
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

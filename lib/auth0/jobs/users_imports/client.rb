# frozen_string_literal: true

module Auth0
  module Jobs
    module UsersImports
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Import users from a <a
        # href="https://auth0.com/docs/users/references/bulk-import-database-schema-examples">formatted file</a> into a
        # connection via a long-running job. When importing users, with or without upsert, the `email_verified` is set
        # to `false` when the email address is added or updated. Users must verify their email address. To avoid this
        # behavior, set `email_verified` to `true` in the imported data.
        #
        # @param request_options [Hash]
        # @param params [void]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Auth0::Types::CreateImportUsersResponseContent]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          body = Internal::Multipart::FormData.new

          body.add_part(params[:users].to_form_data_part(name: "users")) if params[:users]
          if params[:connection_id]
            body.add(
              name: "connection_id",
              value: params[:connection_id]
            )
          end
          if params[:upsert]
            body.add(
              name: "upsert",
              value: params[:upsert]
            )
          end
          if params[:external_id]
            body.add(
              name: "external_id",
              value: params[:external_id]
            )
          end
          if params[:send_completion_email]
            body.add(
              name: "send_completion_email",
              value: params[:send_completion_email]
            )
          end

          request = Auth0::Internal::Multipart::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "jobs/users-imports",
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
            Auth0::Types::CreateImportUsersResponseContent.load(response.body)
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end

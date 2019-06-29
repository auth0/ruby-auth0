module Auth0
  module Api
    module V2
      # Methods to use the jobs endpoints
      module Jobs
        # Retrieves a job. Useful to check its status.
        # @see https://auth0.com/docs/api/v2#!/Jobs/get_jobs_by_job_id
        # @param job_id [string] The ID of the job.
        #
        # @return [json] Returns the job status and properties.
        def get_job(job_id)
          raise Auth0::InvalidParameter, 'Must specify a job id' if job_id.to_s.empty?

          path = "#{jobs_path}/#{job_id}"
          get(path)
        end

        # Retrieve error details based on the id of the job. Useful to check its status.
        # @see https://auth0.com/docs/api/management/v2#!/Jobs/get_errors
        # @param job_id [string] The ID of the job.
        #
        # @return [json] Returns the job error details.
        def get_job_errors(job_id)
          raise Auth0::InvalidParameter, 'Must specify a job id' if job_id.to_s.empty?

          path = "#{jobs_path}/#{job_id}/errors"
          get(path)
        end

        # Imports users to a connection from a file using a long running job.
        # Documentation for the file format: https://docs.auth0.com/bulk-import
        # @see https://auth0.com/docs/api/v2#!/Jobs/post_users_imports
        # @param users_file [file] A file containing the users to import.
        # @param connection_id [string] Database connection ID to import to.
        # @param options [hash]
        #   * :upsert [boolean] Update the user if already exists. False by default.
        #   * :external_id [string] Customer defined id
        #   * :send_completion_email [boolean] If true,
        #     send the completion email to all tenant owners when the job is finished. True by default.
        # @return [json] Returns the job status and properties.
        def import_users(users_file, connection_id, options = {})
          raise Auth0::InvalidParameter, 'Must specify a valid file' if users_file.to_s.empty?
          raise Auth0::InvalidParameter, 'Must specify a connection_id' if connection_id.to_s.empty?

          request_params = {
            users: users_file,
            connection_id: connection_id,
            upsert: options.fetch(:upsert, false),
            external_id: options.fetch(:external_id, nil),
            send_completion_email: options.fetch(:send_completion_email, true)
          }
          path = "#{jobs_path}/users-imports"
          post_file(path, request_params)
        end

        # Export all users to a file using a long running job.
        # @see https://auth0.com/docs/api/v2#!/Jobs/post_users_exports
        # @param options [hash] The options used to configure the output file.
        #   :connection_id [string] Database connection ID to export from.
        #   :format [string] The format of the file. Valid values are: "json" and "csv".
        #   :limit [integer] Limit the number of users to export.
        #   :fields [array] A list of fields to be included in the CSV.
        #     If omitted, a set of predefined fields will be exported.
        #
        # @return [json] Returns the job status and properties.
        def export_users(options = {})
          request_params = {
            connection_id: options.fetch(:connection_id, nil),
            format: options.fetch(:format, nil),
            limit: options.fetch(:limit, nil),
            fields: fields_for_export(options.fetch(:fields, nil))
          }
          path = "#{jobs_path}/users-exports"
          post(path, request_params)
        end

        # Send an email to the specified user that asks them to click a link to verify their email address.
        # @see https://auth0.com/docs/api/management/v2#!/Jobs/post_verification_email
        # @param user_id [string] The user_id of the user to whom the email will be sent.
        # @param client_id [string] Client ID to send an Application-specific email.
        #
        # @return [json] Returns the job status and properties.
        def send_verification_email(user_id, client_id = nil)
          raise Auth0::InvalidParameter, 'Must specify a user id' if user_id.to_s.empty?

          request_params = { user_id: user_id }
          request_params[:client_id] = client_id unless client_id.nil?

          path = "#{jobs_path}/verification-email"
          post(path, request_params)
        end

        private

        # Jobs API path
        def jobs_path
          @jobs_path ||= '/api/v2/jobs'
        end

        # Map array of field names for export to array of objects
        # @param fields [array] Field names to be included in the export

        # @return [array] Returns the fields mapped as array of objects for the export_users endpoint
        def fields_for_export(fields)
          return nil if fields.to_s.empty?

          fields.map { |field| { name: field } }
        end
      end
    end
  end
end

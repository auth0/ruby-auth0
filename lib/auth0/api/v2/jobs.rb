module Auth0
  module Api
    module V2
      # Methods to use the jobs endpoints
      module Jobs
        attr_reader :jobs_path

        # Retrieves a job. Useful to check its status.
        # @see https://auth0.com/docs/api/v2#!/Jobs/get_jobs_by_job_id
        # @param job_id [string] The id of the job.
        #
        # @return [json] Returns the job status and properties.
        def get_job(job_id)
          raise Auth0::InvalidParameter, 'Must specify a job id' if job_id.to_s.empty?
          path = "#{jobs_path}/#{job_id}"
          get(path)
        end

        # Imports users to a connection from a file using a long running job.
        # Important: The documentation for the file format is at https://docs.auth0.com/bulk-import.
        # @see https://auth0.com/docs/api/v2#!/Jobs/post_users_imports
        # @param users_file [file] A file containing the users to import.
        # @param connection_id [string] The connection id of the connection to which users will be inserted.
        #
        # @return [json] Returns the job status and properties.
        def import_users(users_file, connection_id)
          raise Auth0::InvalidParameter, 'Must specify a valid file' if users_file.to_s.empty?
          raise Auth0::InvalidParameter, 'Must specify a connection_id' if connection_id.to_s.empty?
          request_params = {
            users: users_file,
            connection_id: connection_id
          }
          path = "#{jobs_path}/users-imports"
          post_file(path, request_params)
        end

        # Send an email to the specified user that asks them to click a link to verify their email address.
        # @see https://auth0.com/docs/api/v2#!/Jobs/post_verification_email
        # @param user_id [string] The user_id of the user to whom the email will be sent.
        #
        # @return [json] Returns the job status and properties.
        def send_verification_email(user_id)
          raise Auth0::InvalidParameter, 'Must specify a user id' if user_id.to_s.empty?
          request_params = {
            user_id: user_id
          }
          path = "#{jobs_path}/verification-email"
          post(path, request_params)
        end

        private

        # Jobs API path
        def jobs_path
          @jobs_path ||= '/api/v2/jobs'
        end
      end
    end
  end
end

module Auth0
  module Api
    module V2
      # https://auth0.com/docs/apiv2#!/jobs
      module Jobs
        attr_reader :base_path
        # https://auth0.com/docs/apiv2#!/jobs/get_jobs_by_job_id
        def get_job(job_id)
          fail Auth0::InvalidParameter, 'you must specify a job id' if job_id.to_s.empty?
          path  = "#{base_path}/#{job_id}"
          get(path)
        end

        # https://auth0.com/docs/apiv2#!/jobs/post_users_imports
        def import_users(users_file, connection_id)
          fail Auth0::InvalidParameter, 'you must specify a valid file' if users_file.to_s.empty?
          fail Auth0::InvalidParameter, 'you must specify a connection_id' if connection_id.to_s.empty?
          request_params = {
            users: users_file,
            connection_id: connection_id
          }
          path  = "#{base_path}/users-imports"
          post_file(path, request_params)
        end

        # https://auth0.com/docs/api/v2#!/Jobs/post_verification_email
        def send_verification_email(user_id)
          fail Auth0::InvalidParameter, 'you must specify a user id' if user_id.to_s.empty?
          path  = "#{base_path}/verification-email"
          post(path, user_id)
        end

        private

        def base_path
          @base_path ||= '/api/v2/jobs'
        end
      end
    end
  end
end

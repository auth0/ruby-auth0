module Auth0
  module Api
    module V2
      # https://auth0.com/docs/apiv2#!/jobs
      module Jobs
        # https://auth0.com/docs/apiv2#!/jobs/get_jobs_by_job_id
        def get_job(job_id)
          path = "/api/v2/jobs/#{job_id}"
          get(path)
        end

        # HTTParty doesn't support multipart upload, will move this functionality to a separate PR
        # https://auth0.com/docs/apiv2#!/jobs/post_users_imports
        def create_job(_users_file, _connection_name)
          fail NotImplementedError
        end
      end
    end
  end
end

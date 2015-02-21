module Auth0
  module Api
    module V2
      module Jobs
        def get_job(job_id)
          path = "/api/v2/jobs/#{job_id}"
          get(path)
        end

        # HTTParty doesn't support multipart upload, will move this functionality to a separate PR
        def create_job(users_file, connection_name)
          raise NotImplementedError
        end
      end
    end
  end
end

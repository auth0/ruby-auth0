module Auth0
  module Api
    module V1
      # {https://auth0.com/docs/api#logs}
      module Logs
        # https://auth0.com/docs/api/v1#!#logs
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Logs
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def logs(options = {})
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          acceptable_params = %i(take from search_criteria page per_page sort fields exclude_fields)
          options.reject! do |key, value|
            next unless key.nil? || value.nil? || !acceptable_params.include?(key.to_sym)
            warn "#{key} is not in acceptable params list: #{acceptable_params}"
            true
          end
          path = "/api/logs?#{URI.encode_www_form(options)}"
          get(path)
        end

        alias search_logs logs

        # {https://auth0.com/docs/api#!#get--api-logs--_id-}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Logs
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def log(id)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/logs/#{id}"
          get(path)
        end

        # {https://auth0.com/docs/api#!#get--api-users--user_id--logs-page--number--per_page--items-}
        # @deprecated - 4.14.0, please use Auth0::Api::V2::Logs
        # @see - https://auth0.com/docs/migrations/guides/management-api-v1-v2
        def user_logs(user_id, page = 0, per_page = 50)
          warn "[DEPRECATION] Api::V1 is deprecated please use Api::V2"
          path = "/api/users/#{user_id}/logs?page=#{page}&per_page=#{per_page}"
          get(path)
        end
      end
    end
  end
end

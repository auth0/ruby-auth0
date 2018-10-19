module Auth0
  module Api
    module V2
      # Methods to use the Users By Email endpoints
      module UsersByEmail
        attr_reader :users_by_email_path

        # Retrieves a list of existing users by their email.
        # @see https://auth0.com/docs/api/v2#!/Users/get_users
        # @see https://auth0.com/docs/api/management/v2#!/Users_By_Email/get_users_by_email
        # @param email [string] E-mail to be searched
        # @param options [hash]
        #   * :fields [string] A comma separated list of fields to include or exclude from the result.
        #   * :include_fields [boolean] True if the fields specified are to be included in the result, false otherwise.
        #
        # @return [json] Returns the list of existing users.
        def users_by_email(email, options = {})
          raise Auth0::InvalidParameter, 'Must supply a valid email' if email.to_s.empty?
          request_params = {
            fields:         options.fetch(:fields, nil),
            include_fields: options.fetch(:include_fields, nil)
          }
          request_params[:email] = email
          get(users_by_email_path, request_params)
        end

        private

        # Users By Emails API path
        def users_by_email_path
          @users_by_email_path ||= '/api/v2/users-by-email'
        end
      end
    end
  end
end

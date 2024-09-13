# frozen_string_literal: true

module Auth0
  module Api
    module V2
      # Methods to use the Session endpoints
      module Sessions
        # Retrieve session information by id
        # @see https://auth0.com/docs/api/management/v2/sessions/get-session
        # @param id [string] The id of the session to retrieve.
        def session(session_id)
          raise Auth0::InvalidParameter, 'Must supply a valid session_id' if session_id.to_s.empty?

          get "#{sessions_path}/#{session_id}"
        end

        # Deletes a session by id
        # @see https://auth0.com/docs/api/management/v2/sessions/delete-session
        # @param id [string] The id of the session to delete.
        def delete_session(session_id)
          raise Auth0::InvalidParameter, 'Must supply a valid session_id' if session_id.to_s.empty?

          delete "#{sessions_path}/#{session_id}"
        end

        private

        def sessions_path
          @sessions_path ||= '/api/v2/sessions'
        end
      end
    end
  end
end

module Auth0
  module Api
    module V2
       # https://auth0.com/docs/apiv2#!/tickets
      module Tickets
        # https://auth0.com/docs/api/v2#!/Tickets/post_password_change
        def create_password_change_ticket(new_password, options = {})
          path = '/api/v2/tickets/password-change'
          request_params = Hash[options.map { |(k, v)| [k.to_sym, v] }]
          request_params[:new_password] = new_password
          post(path, request_params)
        end
      end
    end
  end
end

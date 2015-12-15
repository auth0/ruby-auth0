module Auth0
  module Api
    module V2
      # https://auth0.com/docs/apiv2#!/clients
      module Clients
        # https://auth0.com/docs/apiv2#!/clients/get_clients
        def clients(fields: nil, include_fields: nil)
          include_fields = true if !fields.nil? && include_fields.nil?
          request_params = {
            fields: fields,
            include_fields: include_fields
          }
          path = '/api/v2/clients'
          get(path, request_params)
        end
        alias_method :get_clients, :clients

        # https://auth0.com/docs/apiv2#!/clients/post_clients
        def create_client(name, options = {})
          fail Auth0::MissingParameter, 'you must specify a valid client name' if name.to_s.empty?
          request_params = Hash[options.map { |(k, v)| [k.to_sym, v] }]
          request_params[:name] = name
          path = '/api/v2/clients'
          post(path, request_params)
        end

        # https://auth0.com/docs/apiv2#!/clients/get_clients_by_id
        def client(client_id, fields: nil, include_fields: nil)
          fail Auth0::MissingClientId, 'you must specify a client id' if client_id.to_s.empty?
          include_fields = true if !fields.nil? && include_fields.nil?
          request_params = {
            fields: fields,
            include_fields: include_fields
          }
          path = "/api/v2/clients/#{client_id}"
          get(path, request_params)
        end

        # https://auth0.com/docs/apiv2#!/clients/delete_clients_by_id
        def delete_client(client_id)
          fail Auth0::MissingClientId, 'you must specify a client id' if client_id.to_s.empty?
          path = "/api/v2/clients/#{client_id}"
          delete(path)
        end

        # https://auth0.com/docs/apiv2#!/clients/patch_clients_by_id
        def patch_client(client_id, options)
          fail Auth0::MissingClientId, 'you must specify a client id' if client_id.to_s.empty?
          fail Auth0::MissingParameter, 'you must specify a valid body' if options.to_s.empty?
          path = "/api/v2/clients/#{client_id}"
          patch(path, options)
        end
      end
    end
  end
end

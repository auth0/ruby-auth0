require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Auth0 < OmniAuth::Strategies::OAuth2
      def initialize(app, args = {})
        super
        self.options.client_options.site = "https://#{args[:namespace]}"
        self.options.client_options.authorize_url = "https://#{args[:namespace]}/authorize"
        self.options.client_options.token_url = "https://#{args[:namespace]}/oauth/token"
        self.options.token_params.client_id = args[:client_id]
        self.options.token_params.client_secret = args[:client_secret]
      end

      PASSTHROUGHS = %w[
        client_id
        response_type
        redirect_uri
        state
        connection
      ]

      option :name, "auth0"

      option :token_params, {
        :client_id => '',
        :client_secret => '',
        :type => 'web_server',
        :grant_type => 'client_credentials'
      }

      def authorize_params
        super.tap do |param|
          PASSTHROUGHS.each do |p|
            param[p.to_sym] = request.params[p] if request.params[p]
          end
        end
      end

      uid { raw_info['user_id'] }

      extra do
        { :raw_info => raw_info }
      end

      info do
        {
          :name => raw_info["name"],
          :email => raw_info["email"],
          :nickname => raw_info["nickname"],
          :first_name => raw_info["given_name"],
          :last_name => raw_info["family_name"],
          :location => raw_info["locale"],
          :image => raw_info["picture"]
        }
      end

      def raw_info
        @raw_info ||= begin
          access_token.options[:mode] = :query
          access_token.options[:param_name] = :access_token
          access_token.get("/identities").parsed
        end
      end
    end
  end
end
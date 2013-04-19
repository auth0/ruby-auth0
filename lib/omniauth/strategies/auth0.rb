require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Auth0 < OmniAuth::Strategies::OAuth2
      PASSTHROUGHS = %w[
        connection
        redirect_uri
      ]

      option :name, "auth0"
      option :namespace, nil

      args [:client_id, :client_secret, :namespace]

      def initialize(app, *args, &block)
        super
        @options.client_options.site          = "https://#{options[:namespace]}"
        @options.client_options.authorize_url = "https://#{options[:namespace]}/authorize"
        @options.client_options.token_url     = "https://#{options[:namespace]}/oauth/token"
        @options.client_options.userinfo_url  = "https://#{options[:namespace]}/userinfo"
      end

      def authorize_params
        super.tap do |param|
          PASSTHROUGHS.each do |p|
            param[p.to_sym] = request.params[p] if request.params[p]
          end
        end
      end

      uid { raw_info["user_id"] }

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
        @raw_info ||= access_token.get(options.client_options.userinfo_url).parsed
      end
    end
  end
end
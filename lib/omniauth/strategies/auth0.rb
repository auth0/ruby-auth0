require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Auth0 < OmniAuth::Strategies::OAuth2
      def initialize(app, args = {})
        super
        self.options.client_options.site = "https://#{args[:namespace]}"
        self.options.client_options.authorize_url = "https://#{args[:namespace]}/authorize"
        self.options.client_options.token_url = "https://#{args[:namespace]}/oauth/token"
      end

      PASSTHROUGHS = %w[
        client_id
        response_type
        redirect_uri
        state
        connection
      ]

      option :name, "auth0"

      def authorize_params
        super.tap do |param|
          PASSTHROUGHS.each do |p|
            param[p.to_sym] = request.params[p] if request.params[p]
          end
        end
      end

      uid { raw_info['_id'] }

      extra do
        { :raw_info => raw_info }
      end

      info do
        {
          :email => raw_info["email"],
          :family_name => raw_info["family_name"],
          :gender => raw_info["gender"],
          :given_name => raw_info["given_name"],
          :name => raw_info["name"],
          :locale => raw_info["locale"],
          :nickname => raw_info["nickname"],
          :picture => raw_info["picture"],
          :user_id => raw_info["user_id"],
        }
      end

      def raw_info
        @raw_info ||= begin
          access_token.options[:mode] = :query
          access_token.options[:param_name] = :access_token
          access_token.get("/profiles").parsed
        end
      end
    end
  end
end
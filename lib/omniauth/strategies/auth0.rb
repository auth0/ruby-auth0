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

      uid { access_token.params['account'] }

      extra do
        { :raw_info => raw_info }
      end

      info do
        {
            :name => retrieve_info["name"],
            :email => retrieve_info["email"],
            :description => retrieve_info["description"],
            :image => retrieve_info["thumbnail_url"],
            :urls => { :url => retrieve_info["url"]}
        }
      end

      def raw_info
        @raw_info ||= begin
          access_token.options[:mode] = :query
          access_token.options[:param_name] = :access_token
          access_token.get("/profiles").parsed
        end
      end

      private

      def retrieve_info
        @info ||= begin
          access_token.options[:mode] = :query
          access_token.options[:param_name] = :access_token
          access_token.get("/profile").parsed
        end
      end
    end
  end
end
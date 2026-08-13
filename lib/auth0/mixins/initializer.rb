# frozen_string_literal: true

require "json"

module Auth0
  module Mixins
    # Help class where Auth0::Client initialization described
    module Initializer
      # Default initialization mechanism, moved here to keep Auth0::Client clear
      # accepts hash as parameter
      # you can get all required fields from here: https://auth0.com/docs/auth-api
      def initialize(config)
        options = config.transform_keys(&:to_sym)
        @base_uri = base_url(options)
        @headers = client_headers
        @timeout = options[:timeout] || 10
        @retry_count = options[:retry_count]
        @client_assertion_signing_key = options[:client_assertion_signing_key]
        @client_assertion_signing_alg = options[:client_assertion_signing_alg] || "RS256"
        @token_provider = options[:token_provider]
        @management_timeout = options[:management_timeout]
        @management_max_retries = options[:management_max_retries]
        @management_additional_headers = options[:management_additional_headers]
        extend Auth0::Api::AuthenticationEndpoints

        @client_id = options[:client_id]
        @client_secret = options[:client_secret]
        @organization = options[:organization]
        initialize_api(options)
      end

      # including initializer in top of klass
      def self.included(klass)
        klass.send :prepend, Initializer
      end

      def authorization_header(token)
        add_headers("Authorization" => "Bearer #{token}")
      end

      def authorization_header_basic(options)
        connection_id = options.fetch(:connection_id, Auth0::Api::AuthenticationEndpoints::UP_AUTH)
        user = options.fetch(:user, nil)
        password = options.fetch(:password, nil)
        add_headers("Authorization" => "Basic #{Base64.strict_encode64("#{connection_id}\\#{user}:#{password}")}")
      end

      private

      def initialize_api(options)
        initialize_token(options)
        raise InvalidCredentials, "Must supply a valid API token" if @token.nil?

        if options.fetch(:authorization, nil) == "Basic"
          authorization_header_basic(options)
        else
          authorization_header(@token)
        end
      end

      def base_url(options)
        @domain = options[:domain] || options[:namespace]
        raise InvalidApiNamespace, "API namespace must supply an API domain" if @domain.to_s.empty?

        "https://#{@domain}"
      end
    end
  end
end

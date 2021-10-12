require 'json'

module Auth0
  module Mixins
    # Help class where Auth0::Client initialization described
    module Initializer

      # Default initialization mechanism, moved here to keep Auth0::Client clear
      # accepts hash as parameter
      # you can get all required fields from here: https://auth0.com/docs/auth-api
      #
      # By Default API v2
      def initialize(config)
        options = Hash[config.map { |(k, v)| [k.to_sym, v] }]
        @base_uri = base_url(options)
        @headers = client_headers
        @timeout = options[:timeout] || 10
        @retry_count = options[:retry_count]
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
        add_headers('Authorization' => "Bearer #{token}")
      end

      def authorization_header_basic(options)
        connection_id = options.fetch(:connection_id, Auth0::Api::AuthenticationEndpoints::UP_AUTH)
        user = options.fetch(:user, nil)
        password = options.fetch(:password, nil)
        add_headers('Authorization' => "Basic #{Base64.strict_encode64("#{connection_id}\\#{user}:#{password}")}")
      end

      private

      def initialize_api(options)
        initialize_v2(options)
        raise InvalidCredentials, 'Must supply a valid API token' if @token.nil?
        if options.fetch(:authorization, nil) == 'Basic'
          authorization_header_basic(options)
        else
          authorization_header(@token)
        end
      end

      def base_url(options)
        @domain = options[:domain] || options[:namespace]
        raise InvalidApiNamespace, 'API namespace must supply an API domain' if @domain.to_s.empty?
        "https://#{@domain}"
      end

      def initialize_v2(options)
        extend Auth0::Api::V2
        initialize_token(options)
      end

      def api_v2?(options)
        version = options[:api_version] || 2
        protocol = options[:protocols].to_s
        !protocol.include?('v1') && (protocol.include?('v2') || version == 2)
      end
    end
  end
end

module Auth0
  module Mixins
    # Help class where Auth0::Client initialization described
    module Initializer
      # Default initialization mechanism, moved here to keep Auth0::Client clear
      # accepts hash as parameter
      # you can get all required fields from here: https://auth0.com/docs/auth-api
      #
      # To run using api v2, pass api_version: 2 when creating a client
      def initialize(config)
        options = Hash[config.map{|(k,v)| [k.to_sym,v]}]
        domain = api_domain options
        raise InvalidApiNamespace, "Api namespace must supply an API domain" if domain.nil?
        self.class.base_uri "https://#{domain}"
        self.class.headers "Content-Type"  => 'application/json'
        self.extend Auth0::Api::AuthenticationEndpoints
        @client_id      = options[:client_id]
        initialize_v2(options) if api_v2?(options)
        initialize_v1(options) if api_v1?(options)
        raise InvalidCredentials, "Must supply a valid API token" if @token.nil?
        self.class.headers "Authorization" => "Bearer #{@token}"
      end

      # including initializer in top of klass
      def self.included(klass)
        klass.send :prepend, Initializer
      end

      private

      def api_domain(options)
        options[:domain] || options[:namespace]
      end

      def initialize_v2(options)
        self.extend Auth0::Api::V2
        @token = options[:access_token] || options[:token]
      end

      def initialize_v1(options)
        self.extend Auth0::Api::V1
        @client_secret  = options[:client_secret]
        raise InvalidCredentials, "Invalid API v1 client_id and client_secret" if @client_id.nil? or @client_secret.nil?
        @token = obtain_access_token
      end

      def api_v2?(options)
        options[:protocols].to_s.include?("v2") or options[:api_version] === 2
      end

      def api_v1?(options)
        version = options[:api_version] || 1
        protocol = options[:protocols].to_s
        not protocol.include?("v2") and (protocol.include?("v1") or version === 1)
      end

    end
  end
end

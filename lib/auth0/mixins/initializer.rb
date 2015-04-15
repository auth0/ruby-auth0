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
        raise InvalidApiNamespace, "Api namespace must supply an API namespace" if options[:namespace].nil?
        self.class.base_uri "https://#{options[:namespace]}"
        self.class.headers "Content-Type"  => 'application/json'
        self.extend Auth0::Api::AuthenticationEndpoints
        @client_id      = options[:client_id]
        if options[:protocols].to_s.include?("v2") or options[:api_version] === 2
          self.extend Auth0::Api::V2
          @token = options[:access_token] || options[:token]
          raise InvalidCredentials, "Invalid API v2 token" if @token.nil?
        else
          self.extend Auth0::Api::V1
          @client_secret  = options[:client_secret]
          raise InvalidCredentials, "Invalid API v1 client_id and client_secret" if @client_id.nil? or @client_secret.nil?
          @token          = obtain_access_token
        end
        self.class.headers "Authorization" => "Bearer #{@token}"
      end

      # including initializer in top of klass
      def self.included(klass)
        klass.send :prepend, Initializer
      end

    end
  end
end

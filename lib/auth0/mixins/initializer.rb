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
        self.class.base_uri "https://#{options[:namespace]}"
        self.class.headers "Content-Type"  => 'application/json'
        if options[:protocols].to_s.include?("v2") or options[:api_version] === 2
          self.extend Auth0::Api::V2
          @token = options[:access_token] or options[:token]
        else
          self.extend Auth0::Api::V1
          self.extend Auth0::Api::AuthenticationEndpoints
          @client_id      = options[:client_id]
          @client_secret  = options[:client_secret]
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

module Auth0
  module Mixins
    # Help class where Auth0::Client initialization described
    module Initializer
      # Default initialization mechanism, moved here to keep Auth0::Client clear
      # accepts hash as parameter
      # you can get all required fields from here: https://auth0.com/docs/auth-api
      def initialize(config)
        options = Hash[config.map{|(k,v)| [k.to_sym,v]}]
        self.class.base_uri "https://#{options[:namespace]}"
        self.class.headers "Content-Type"  => 'application/json'
        @client_id      = options[:client_id]
        @client_secret  = options[:client_secret]
        @token          = obtain_access_token
        self.class.headers "Authorization" => "Bearer #{@token}"
      end

      # including initializer in top of klass
      def self.included(klass)
        klass.send :prepend, Initializer
      end

    end
  end
end

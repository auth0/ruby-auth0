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
        self.class.base_uri base_url(options)
        self.class.headers client_headers(config)
        extend Auth0::Api::AuthenticationEndpoints
        @client_id = options[:client_id]
        initialize_api(options)
      end

      # including initializer in top of klass
      def self.included(klass)
        klass.send :prepend, Initializer
      end

      def authorization_header(token)
        self.class.headers 'Authorization' => "Bearer #{token}"
      end

      def authorization_header_basic(options)
        connection_id = options.fetch(:connection_id, Auth0::Api::AuthenticationEndpoints::UP_AUTH)
        user = options.fetch(:user, nil)
        password = options.fetch(:password, nil)
        self.class.headers 'Authorization' => "Basic #{Base64.strict_encode64("#{connection_id}\\#{user}:#{password}")}"
      end

      private

      def initialize_api(options)
        api_v1?(options) ? initialize_v1(options) : initialize_v2(options)
        raise InvalidCredentials, 'Must supply a valid API token' if @token.nil?
        if options.fetch(:authorization, nil) == 'Basic'
          authorization_header_basic(options)
        else
          authorization_header(@token)
        end
      end

      def base_url(options)
        @domain = options[:domain] || options[:namespace]
        raise InvalidApiNamespace, 'Api namespace must supply an API domain' if @domain.to_s.empty?
        "https://#{@domain}"
      end

      def client_headers(config)
        client_info = JSON.dump(name: 'ruby-auth0', version: Auth0::VERSION)

        headers = {
          'Content-Type' => 'application/json'
        }

        unless config[:opt_out_sdk_info]
          headers['User-Agent'] = "Ruby/#{RUBY_VERSION}"
          headers['Auth0-Client'] = Base64.urlsafe_encode64(client_info)
        end

        headers
      end

      def initialize_v2(options)
        extend Auth0::Api::V2
        @client_secret = options[:client_secret]
        @token = options[:access_token] || options[:token]
      end

      def initialize_v1(options)
        extend Auth0::Api::V1
        @client_secret = options[:client_secret]
        raise InvalidCredentials, 'Invalid API v1 client_id and client_secret' if @client_id.nil? || @client_secret.nil?
        @token = obtain_access_token
      end

      def api_v1?(options)
        version = options[:api_version] || 1
        protocol = options[:protocols].to_s
        !protocol.include?('v2') && (protocol.include?('v1') || version == 1)
      end
    end
  end
end

module Auth0
  module Mixins
    module TokenManagement
      
      private

      def initialize_token(options)
        @token = options[:access_token] || options[:token]
        # default expiry to an hour if a token was given but no expires_at
        @token_expires_at = @token ? options[:token_expires_at] || Time.now.to_i + 3600 : nil 

        @audience = options[:api_identifier] || "https://#{@domain}/api/v2/"
        get_token() if @token.nil?
      end

      def get_token
        # pp @token_expires_at
        has_expired = @token && @token_expires_at ? @token_expires_at < (Time.now.to_i + 10) : false
        
        if (@token.nil? || has_expired) && @client_id && @client_secret
          response = api_token(audience: @audience)
          @token = response.token
          @token_expires_at = response.expires_in ? Time.now.to_i + response.expires_in : nil

          @token
        else
          @token
        end
      end
    end
  end
end
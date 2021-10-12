module Auth0
  module Mixins
    module TokenManagement
      
      private

      def initialize_token(options)
        @token = options[:access_token] || options[:token]
        api_identifier = options[:api_identifier] || "https://#{@domain}/api/v2/"
        @token = get_token(audience: api_identifier) if @token.nil?
      end

      def get_token(client_id: @client_id, client_secret: @client_secret, audience: nil)
        @token_response = api_token(audience: audience) if @token.nil? && @client_id && @client_secret
        @token_response.token unless @token_response.nil?
      end
    end
  end
end
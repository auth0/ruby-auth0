class SecuredController < ApplicationController
  before_action :validate_token

  class InvalidTokenError < StandardError; end  

  private
 
  def validate_token
    begin
      authorization = request.headers['Authorization']
      raise InvalidTokenError if authorization.nil?

      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, 
        JWT.base64url_decode(Rails.application.secrets.auth0_client_secret))

      raise InvalidTokenError if Rails.application.secrets.auth0_client_id != decoded_token[0]["aud"]
    rescue JWT::DecodeError, InvalidTokenError
      render text: "Unauthorized", status: :unauthorized
    end
  end
  
end

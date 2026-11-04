Auth0::AccessToken = Struct.new(
  :access_token,
  :expires_in,
  :refresh_token,
  :id_token,
  :authorization_details
) do

  def self.from_response(response)
    new(
      response['access_token'],
      response['expires_in'],
      response['refresh_token'],
      response['id_token'],
      response['authorization_details']
    )
  end

  def token
    access_token
  end
end

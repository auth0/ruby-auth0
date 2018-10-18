AccessToken = Struct.new(
  :access_token,
  :expires_in,
  :refresh_token,
  :id_token
) do

  def self.from_response(response)
    new(
      response['access_token'],
      response['expires_in'],
      response['refresh_token'],
      response['id_token']
    )
  end

  def token
    access_token
  end
end

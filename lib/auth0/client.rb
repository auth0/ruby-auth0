require 'httparty'

class Auth0Client
  include HTTParty
  base_uri 'login.auth0.com'

  def initialize(options)
    self.class.base_uri "https://#{options[:namespace]}"

    token_reponse = self.class.post("/oauth/token", {
      body: {
        'client_id'     => options[:client_id],
        'client_secret' => options[:client_secret],
        'grant_type'    => 'client_credentials'
      }
    })

    unless token_reponse.code == 200
      raise "Error geting the token: #{token_reponse.body}"
    end

    @token = token_reponse["access_token"]
    @headers = {
      "Authorization" => "Bearer #{@token}"
    }
  end

  def get_connections
    response = self.class.get("/api/connections", { headers: @headers })
    response.body
  end

  def delete_user(id)
    response = self.class.delete("/api/users/#{id}", { headers: @headers })
    response.body
  end
end
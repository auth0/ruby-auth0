require 'uri'
require 'json'
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

  def impersonate_user(id, options)
    fail "#{__method__}: No id" if id.to_s.empty?

    uri = URI.escape("/users/#{id}/impersonate")
    response = self.class.post(uri, {
      headers: @headers.merge({ 'Content-Type' => 'application/json' }),
      body: {
        protocol: options.fetch(:protocol),
        impersonator_id: options.fetch(:impersonator_id),
        client_id: options.fetch(:client_id),
        additionalParameters: {
          response_type: options[:response_type],
          scope: options[:scope],
          callback_url: options[:callback_url],
        }
      }.to_json
    })
    response.body
  end

  def delete_user(id)
    response = self.class.delete("/api/users/#{id}", { headers: @headers })
    response.body
  end

  def delegation(options)
    response = self.class.post("/delegation", {
                body: {
                  client_id: options[:client_id],
                  grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
                  id_token: options[:id_token],
                  target: options[:target],
                  scope: "open_id"
                }
              })
    response.body
  end
end

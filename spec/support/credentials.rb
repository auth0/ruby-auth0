module Credentials
  def v1_creds
    { client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      domain: ENV['DOMAIN'],
      api_version: 1 }
  end

  def v1_global_creds
    { client_id: ENV['GLOBAL_CLIENT_ID'],
      client_secret: ENV['GLOBAL_CLIENT_SECRET'],
      domain: ENV['DOMAIN'],
      api_version: 1 }
  end

  def v2_creds
    { client_id: ENV['CLIENT_ID'],
      token: ENV['MASTER_JWT'],
      domain: ENV['DOMAIN'] }
  end
end

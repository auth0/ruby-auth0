module Credentials
  def v1_global_creds
    { client_id: ENV['GLOBAL_CLIENT_ID'],
      client_secret: ENV['GLOBAL_CLIENT_SECRET'],
      token: ENV['MASTER_JWT'],
      domain: ENV['DOMAIN'] }
  end

  def v2_creds
    { client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      token: ENV['MASTER_JWT'],
      domain: ENV['DOMAIN'] }
  end
end

module Credentials
  module_function

  def v1_creds
    {
      client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      domain: ENV['DOMAIN'],
      api_version: 1
    }
  end

  def v1_global_creds
    {
      client_id: ENV['GLOBAL_CLIENT_ID'],
      client_secret: ENV['GLOBAL_CLIENT_SECRET'],
      domain: ENV['DOMAIN'],
      api_version: 1
    }
  end

  def v2_creds
    {
      domain: ENV.fetch( 'DOMAIN', 'DOMAIN' ),
      client_id: ENV.fetch( 'CLIENT_ID', 'CLIENT_ID' ),
      client_secret: ENV.fetch( 'CLIENT_SECRET', 'TEST_CLIENT_SECRET' ),
      token: ENV.fetch( 'MASTER_JWT', 'TEST_MASTER_JWT' )
    }
  end
end

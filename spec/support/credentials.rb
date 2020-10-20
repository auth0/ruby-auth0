module Credentials
  module_function
  def v2_creds
    {
      domain: ENV.fetch( 'DOMAIN', 'DOMAIN' ),
      client_id: ENV.fetch( 'CLIENT_ID', 'CLIENT_ID' ),
      client_secret: ENV.fetch( 'CLIENT_SECRET', 'TEST_CLIENT_SECRET' ),
      token: ENV.fetch( 'MASTER_JWT', 'TEST_MASTER_JWT' )
    }
  end
end

class DummyClass
  attr_reader :domain, :client_id, :client_secret, :audience

  def initialize
    @domain = 'test.auth0.com'
    @client_id = '__test_client_id__'
    @client_secret = '__test_client_secret__'
    @audience = "https://#{@domain}/api/v2/"
  end

  %i(get post put patch delete).each do |method|
    define_method(method) do |_path, _body = {}|
      true
    end
  end
end

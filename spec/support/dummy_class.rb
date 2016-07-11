class DummyClass
  attr_reader :domain, :client_id

  def initialize
    @domain = 'test.auth0.com'
    @client_id = 'NyW50o8Qt8I1VhMVlTlfVwWLGzBIPuxb'
  end

  %i(get post put patch delete).each do |method|
    define_method(method) do |_path, _body = {}|
      true
    end
  end
end

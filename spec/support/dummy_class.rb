class DummyClass
  attr_reader :domain

  def initialize
    @domain = 'test.auth0.com'
  end

  %i(get post put patch delete).each do |method|
    define_method(method) do |_path, _body = {}|
      true
    end
  end
end

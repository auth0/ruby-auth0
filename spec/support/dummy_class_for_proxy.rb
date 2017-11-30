class DummyClassForProxy
  include Auth0::Mixins::HTTPProxy
  @base_uri = 'http://auth0.com'
end

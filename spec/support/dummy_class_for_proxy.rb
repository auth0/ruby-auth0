class DummyClassForProxy
  include Auth0::Mixins::HTTPProxy
  include Auth0::Mixins::Headers
  @base_uri = 'http://auth0.com'
end

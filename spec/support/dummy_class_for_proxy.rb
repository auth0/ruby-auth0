class DummyClassForProxy
  include Auth0::Mixins::HTTPProxy
  include Auth0::Mixins::Headers
  include Auth0::Mixins::TokenManagement
end
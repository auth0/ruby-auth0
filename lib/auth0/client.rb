module Auth0
  # Main class
  # All Api calls are suposed to return hashes, but delete actions return strings.
  class Client
    include Auth0::Mixins
    include HTTMultiParty
    base_uri 'http://auth0.com'
  end
end

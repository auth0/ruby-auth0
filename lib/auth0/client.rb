# Main class
# All Api calls are suposed to return hashes, but delete actions return strings.
class Auth0::Client
  include Auth0::Mixins
  include HTTParty
  base_uri "http://auth0.com"
end

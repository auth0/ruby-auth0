# Examples using ruby-auth0

## Build a URL to Universal Login Page

```ruby
require 'auth0'

client = Auth0Client.new(
  client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
  client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET'],
  domain: ENV['AUTH0_RUBY_DOMAIN'],
)

client.authorize_url 'http://localhost:3000'

> => #<URI::HTTPS https://YOUR_DOMAIN/authorize?client_id=YOUR_CLIENT_ID&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A3000>

```

## Management API Client

As a simple example of how to get started with the management API, we'll create an admin route to point to a list of all users from Auth0:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # ...
  get 'admin/users', to: 'all_users#index'
  # ...
end
```

... and a Controller to handle that route:

```ruby
# app/controllers/all_users_controller.rb
require 'auth0'

class AllUsersController < ApplicationController
  # Get all users from Auth0 with "auth0" in their email.
  def index
    @params = {
      q: "email:*auth0*",
      fields: 'email,user_id,name',
      include_fields: true,
      page: 0,
      per_page: 50
    }
    @users = auth0_client.users @params
  end

  private

  # Setup the Auth0 API connection.
  def auth0_client
    @auth0_client ||= Auth0Client.new(
      client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
      client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET'],
      domain: ENV['AUTH0_RUBY_DOMAIN'],
      api_version: 2,
      timeout: 15 # optional, defaults to 10
    )
  end
end
```

In this example, we're using environment variables to store the values needed to connect to Auth0 and authorize. The `token` used above is an API token for the Management API with the scopes required to perform a specific action (in this case `read:users`). These tokens can be [generated manually](https://auth0.com/docs/api/management/v2/tokens#get-a-token-manually) using a test Application or with the [Application](https://manage.auth0.com/#/applications) being used for your project.

Finally, we'll add a view to display the results:

```ruby
# app/views/all_users/index.html.erb
<h1>Users</h1>
<%= debug @params %>
<%= debug @users %>
```

This should show the parameters passed to the `users` method and a list of users that matched the query (or an empty array if none).

## Organizations

[Organizations](https://auth0.com/docs/organizations) is a set of features that provide better support for developers who build and maintain SaaS and Business-to-Business (B2B) applications.

Note that Organizations is currently only available to customers on our Enterprise and Startup subscription plans.

### Logging in with an Organization

Configure the Authentication API client and pass your Organization ID to the authorize url:

```ruby
require 'auth0'

@auth0_client ||= Auth0Client.new(
  client_id: '{YOUR_APPLICATION_CLIENT_ID}',
  client_secret: '{YOUR_APPLICATION_CLIENT_SECRET}',
  domain: '{YOUR_TENANT}.auth0.com',
  organization: "{YOUR_ORGANIZATION_ID}"
)

universal_login_url = @auth0_client.authorization_url("https://{YOUR_APPLICATION_CALLBACK_URL}")

# redirect_to universal_login_url
```

### Accepting user invitations

Auth0 Organizations allow users to be invited using emailed links, which will direct a user back to your application. The URL the user will arrive at is based on your configured `Application Login URI`, which you can change from your Application's settings inside the Auth0 dashboard. When they arrive at this URL, a `invitation` and `organization` query parameters will be provided

```ruby
require 'auth0'

@auth0_client ||= Auth0Client.new(
  client_id: '{YOUR_APPLICATION_CLIENT_ID}',
  client_secret: '{YOUR_APPLICATION_CLIENT_ID}',
  domain: '{YOUR_TENANT}.auth0.com',
  organization: "{YOUR_ORGANIZATION_ID}"
)

universal_login_url = @auth0_client.authorization_url("https://{YOUR_APPLICATION_CALLBACK_URL}", {
  organization: "{ORGANIZATION_QUERY_PARAM}", # You can override organization if needed
  invitation: "{INVITATION_QUERY_PARAM}"
})

# redirect_to universal_login_url
```

## ID Token Validation

An ID token may be present in the credentials received after authentication. This token contains information associated with the user that has just logged in, provided the scope used contained `openid`. You can [read more about ID tokens here](https://auth0.com/docs/tokens/concepts/id-tokens).

Before accessing its contents, you must first validate the ID token to ensure it has not been tampered with and that it is meant for your application to consume. Use the `validate_id_token` method to do so:

```ruby
begin
  @auth0_client.validate_id_token 'YOUR_ID_TOKEN'
rescue Auth0::InvalidIdToken => e
  # In this case the ID Token contents should not be trusted
end
```

The method takes the following optional keyword parameters:

| Parameter      | Type           | Description                                                                                                               | Default value                                                                                                          |
| -------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `algorithm`    | `JWTAlgorithm` | The [signing algorithm](https://auth0.com/docs/tokens/concepts/signing-algorithms) used by your Auth0 application.        | `Auth0::Algorithm::RS256` (using the [JWKS URL](https://auth0.com/docs/tokens/concepts/jwks) of your **Auth0 Domain**) |
| `leeway`       | Integer        | Number of seconds to account for clock skew when validating the `exp`, `iat` and `azp` claims.                            | `60`                                                                                                                   |
| `nonce`        | String         | The `nonce` value you sent in the call to `/authorize`, if any.                                                           | `nil`                                                                                                                  |
| `max_age`      | Integer        | The `max_age` value you sent in the call to `/authorize`, if any.                                                         | `nil`                                                                                                                  |
| `issuer`       | String         | By default the `iss` claim will be checked against the URL of your **Auth0 Domain**. Use this parameter to override that. | `nil`                                                                                                                  |
| `audience`     | String         | By default the `aud` claim will be compared to your **Auth0 Client ID**. Use this parameter to override that.             | `nil`                                                                                                                  |
| `organization` | String         | By default the `org_id` claim will be compared to your **Organization ID**. Use this parameter to override that.          | `nil`                                                                                                                  |

You can check the signing algorithm value under **Advanced Settings > OAuth > JsonWebToken Signature Algorithm** in your Auth0 application settings panel. [We recommend](https://auth0.com/docs/tokens/concepts/signing-algorithms#our-recommendation) that you make use of asymmetric signing algorithms like `RS256` instead of symmetric ones like `HS256`.

```ruby
# HS256

begin
  @auth0_client.validate_id_token 'YOUR_ID_TOKEN', algorithm: Auth0::Algorithm::HS256.secret('YOUR_SECRET')
rescue Auth0::InvalidIdToken => e
  # Handle error
end

# RS256 with a custom JWKS URL

begin
  @auth0_client.validate_id_token 'YOUR_ID_TOKEN', algorithm: Auth0::Algorithm::RS256.jwks_url('YOUR_URL')
rescue Auth0::InvalidIdToken => e
  # Handle error
end
```

### Organization ID Token Validation

If an org_id claim is present in the Access Token, then the claim should be validated by the API to ensure that the value received is expected or known.

In particular:

- The issuer (iss) claim should be checked to ensure the token was issued by Auth0

- the org_id claim should be checked to ensure it is a value that is already known to the application. This could be validated against a known list of organization IDs, or perhaps checked in conjunction with the current request URL. e.g. the sub-domain may hint at what organization should be used to validate the Access Token.

Normally, validating the issuer would be enough to ensure that the token was issued by Auth0. In the case of organizations, additional checks should be made so that the organization within an Auth0 tenant is expected.

If the claim cannot be validated, then the application should deem the token invalid.

```ruby
begin
  @auth0_client.validate_id_token 'YOUR_ID_TOKEN', organization: '{Expected org_id}'
rescue Auth0::InvalidIdToken => e
  # In this case the ID Token contents should not be trusted
end
```

For more information, please read [Work with Tokens and Organizations](https://auth0.com/docs/organizations/using-tokens) on Auth0 Docs.

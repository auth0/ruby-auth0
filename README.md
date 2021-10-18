# Auth0 - Ruby

[![CircleCI](https://img.shields.io/circleci/project/github/auth0/ruby-auth0/master.svg)](https://circleci.com/gh/auth0/ruby-auth0)
[![Gem Version](https://badge.fury.io/rb/auth0.svg)](http://badge.fury.io/rb/auth0)
[![codecov](https://codecov.io/gh/auth0/ruby-auth0/branch/master/graph/badge.svg)](https://codecov.io/gh/auth0/ruby-auth0)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/auth0/ruby-auth0/master/frames)
[![MIT licensed](https://img.shields.io/dub/l/vibe-d.svg?style=flat)](https://github.com/auth0/ruby-auth0/blob/master/LICENSE)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fauth0%2Fruby-auth0.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fauth0%2Fruby-auth0?ref=badge_shield)

Ruby API client for the [Auth0](https://auth0.com) platform.

## Installation

This gem can be installed directly:

```bash
$ gem install auth0
```

... or with [Bundler](https://bundler.io/man/bundle-add.1.html):

```bash
bundle add auth0
```

## API Documentation

https://www.rubydoc.info/gems/auth0

## Management API v2

This SDK provides access to the [Management API v2](https://auth0.com/docs/api/management/v2) via modules that help create clear and accurate calls. Most of the interaction is done through the `Auth0Client` class, instantiated with the required credentials.

As a simple example of how to get started, we'll create an admin route to point to a list of all users from Auth0:

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
# app/controllers/all_users_controllers.rb
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
      # If you pass in a client_secret value, the SDK will automatically try to get a
      # Management API token for this application. Make sure your Application can make a
      # Client Credentials grant (Application settings in Auth0 > Advanced > Grant Types
      # tab) and that the Application is authorized for the Management API:
      # https://auth0.com/docs/api-auth/config/using-the-auth0-dashboard
      #
      # Otherwise, you can pass in a Management API token directly for testing or temporary
      # access using the key below.
      # token: ENV['AUTH0_RUBY_API_TOKEN'],
      #
      # When passing a token, you can also specify when the token expires in seconds from epoch. Otherwise, expiry is set
      # by default to an hour from now.
      # token_expires_at: Time.now.to_i + 86400,
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

### Token management

If `token` is omitted, the SDK will attempt to fetch a new token using the `client_credentials` grant, provided that `client_id` and `client_secret` are provided in the configuration. Once the token is about to expire (or has already expired), a new token will be fetched and cached for future calls.

For this to work, ensure your application can make a Client Credentials grant (Application settings in Auth0 > Advanced > Grant Types tab) and that the application is authorized for the Management API: https://auth0.com/docs/api-auth/config/using-the-auth0-dashboard

## Authentication

In addition to the Management API, this SDK also provides access to [Authentication API](https://auth0.com/docs/api/authentication) endpoints with the `Auth0::API::AuthenticationEndpoints` module. For basic login capability, we suggest using our OmniAuth stategy [detailed here](https://auth0.com/docs/quickstart/webapp/rails/01-login). Other authentication tasks currently supported are:

- Register a new user with a database connection using the `signup` method.
- Redirect a user to the universal login page for authentication using the `authorization_url` method.
- Log a user into a highly trusted app with the [Resource Owner Password grant](https://auth0.com/docs/api-auth/tutorials/password-grant) using the `login` method.
- Exchange an authorization code for an access token on callback using the `obtain_user_tokens` method (see the note on state validation below).
- Send a change password email to a database connection user using the `change_password` method.
- Log a user out of Auth0 with the `logout_url` method.

**Important note on state validation**: If you choose to implement a login flow callback yourself, it is important to generate and store a `state` value, pass that value to Auth0 in the `authorization_url` method, and validate it in your callback URL before calling `obtain_user_tokens`. For more information on state validation, [please see our documentation](https://auth0.com/docs/protocols/oauth2/oauth-state).

Please note that this module implements endpoints that might be deprecated for newer tenants. If you have any questions about how and when the endpoints should be used, consult the [documentation](https://auth0.com/docs/api/authentication) or ask in our [Community forums](https://community.auth0.com/tags/wordpress).

### Organizations

[Organizations](https://auth0.com/docs/organizations) is a set of features that provide better support for developers who build and maintain SaaS and Business-to-Business (B2B) applications.

Note that Organizations is currently only available to customers on our Enterprise and Startup subscription plans.

#### Logging in with an Organization

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

#### Accepting user invitations

Auth0 Organizations allow users to be invited using emailed links, which will direct a user back to your application. The URL the user will arrive at is based on your configured `Application Login URI`, which you can change from your Application's settings inside the Auth0 dashboard.  When they arrive at this URL, a `invitation` and `organization` query parameters will be provided

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

| Parameter     | Type           | Description   | Default value             |
| ------------- | -------------- | ------------- | ------------------------- |
| `algorithm`   | `JWTAlgorithm` | The [signing algorithm](https://auth0.com/docs/tokens/concepts/signing-algorithms) used by your Auth0 application.  | `Auth0::Algorithm::RS256` (using the [JWKS URL](https://auth0.com/docs/tokens/concepts/jwks) of your **Auth0 Domain**) |
| `leeway`      | Integer        | Number of seconds to account for clock skew when validating the `exp`, `iat` and `azp` claims.  | `60`  |
| `nonce`       | String         | The `nonce` value you sent in the call to `/authorize`, if any.  | `nil`  |
| `max_age`     | Integer        | The `max_age` value you sent in the call to `/authorize`, if any.  | `nil`  |
| `issuer`      | String         | By default the `iss` claim will be checked against the URL of your **Auth0 Domain**. Use this parameter to override that. | `nil`  |
| `audience`    | String         | By default the `aud` claim will be compared to your **Auth0 Client ID**. Use this parameter to override that.  | `nil`  |
| `organization`| String         | By default the `org_id` claim will be compared to your **Organization ID**. Use this parameter to override that.  | `nil`  |

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

* The issuer (iss) claim should be checked to ensure the token was issued by Auth0

* the org_id claim should be checked to ensure it is a value that is already known to the application. This could be validated against a known list of organization IDs, or perhaps checked in conjunction with the current request URL. e.g. the sub-domain may hint at what organization should be used to validate the Access Token.

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

## Development

In order to set up the local environment you'd have to have Ruby installed and a few global gems used to run and record the unit tests. A working Ruby version can be taken from the [CI script](/.circleci/config.yml). At the moment of this writting we're using Ruby `2.5.7`.

> It is expected that every Pull Request introducing a fix, change or feature contains enough test coverage to assert the new behavior.

### Running the tests

Install the gems required for this project.

```bash
bundle install
```

Finally, run the tests.

```bash
bundle exec rake test
```

#### Running only unit tests

You can run only the unit tests and ignore the integration tests by running the following:

```bash
bundle exec rake spec
```

#### Running only integration tests

You can run only the unit tests and ignore the integration tests by running the following:

```bash
bundle exec rake integration
```

## More Information

- [Login using OmniAuth](https://auth0.com/docs/quickstart/webapp/rails/01-login)
- [API authentication in Ruby](https://auth0.com/docs/quickstart/backend/ruby)
- [API authentication in Rails](https://auth0.com/docs/quickstart/backend/rails)
- [Managing authentication with Auth0 (blog)](https://auth0.com/blog/rails-5-with-auth0/)
- [Ruby on Rails workflow with Docker (blog)](https://auth0.com/blog/ruby-on-rails-killer-workflow-with-docker-part-1/)

## What is Auth0?

Auth0 helps you to:

- Add authentication with [multiple authentication sources](https://docs.auth0.com/identityproviders), either social like **Google, Facebook, Microsoft Account, LinkedIn, GitHub, Twitter, Box, Salesforce** among others, or enterprise identity systems like **Windows Azure AD, Google Apps, Active Directory, ADFS or any SAML Identity Provider**.
- Add authentication through more traditional **[username/password databases](https://docs.auth0.com/mysql-connection-tutorial)**.
- Add support for **[linking different user accounts](https://docs.auth0.com/link-accounts)** with the same user.
- Support for generating signed [JSON Web Tokens](https://docs.auth0.com/jwt) to call your APIs and **flow the user identity** securely.
- Analytics of how, when, and where users are logging in.
- Pull data from other sources and add it to the user profile with [JavaScript rules](https://docs.auth0.com/rules).

## Create a free Auth0 Account

1. Go to [Auth0](https://auth0.com) and click Sign Up.
2. Use Google, GitHub or Microsoft Account to login.

## Issue Reporting

If you find a bug or have a feature request, please report them in this repository's [Issues tab](https://github.com/auth0/ruby-auth0/issues). Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

## Author

[Auth0](https://auth0.com)

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file for more info.


[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fauth0%2Fruby-auth0.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fauth0%2Fruby-auth0?ref=badge_large)

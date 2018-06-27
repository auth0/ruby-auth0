[![Build Status](https://travis-ci.org/auth0/ruby-auth0.svg?branch=master)](https://travis-ci.org/auth0/ruby-auth0)
[![Gem Version](https://badge.fury.io/rb/auth0.svg)](http://badge.fury.io/rb/auth0)
[![Coverage Status](https://coveralls.io/repos/auth0/ruby-auth0/badge.svg?branch=master)](https://coveralls.io/r/auth0/ruby-auth0?branch=master)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/auth0/ruby-auth0/master/frames)

Ruby API client for the [Auth0](https://auth0.com) platform.

## Installation

This gem can be installed directly:

``` bash
$ gem install auth0
```

... or with [Bundler](https://bundler.io/man/bundle-add.1.html):

```bash
bundle add auth0
```

## API Documentation

You can build the API documentation with the following:

``` bash
bundle exec rake documentation
```

To view the generated documentation, open `doc/Auth0/Api.html`

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
      token: ENV['AUTH0_RUBY_API_TOKEN'],
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

## Authentication

In addition to the Management API, this SDK also provides access to [Authentication API](https://auth0.com/docs/api/authentication) endpoints with the `Auth0::API::AuthenticationEndpoints` module. For basic login capability, we suggest using our OmniAuth stategy [detailed here](https://auth0.com/docs/quickstart/webapp/rails/01-login). Other authentication tasks currently supported are:

* Register a new user with a database connection using the `signup` method.
* Redirect a user to the universal login page for authentication using the `authorization_url` method.
* Log a user in to a highly trusted app with the [Resource Owner Password grant](https://auth0.com/docs/api-auth/tutorials/password-grant) using the `login` method.
* Exchange an authorization code for an access token on callback using the `obtain_user_tokens` method (see the note on state validation below).
* Send a change password email to a database connection user using the `change_password` method.
* Log a user out of Auth0 with the `logout_url` method.

**Important note on state validation**: If you choose to implement a login flow callback youself, it is important to generate and store a `state` value, pass that value to Auth0 in the `authorization_url` method, and validate it in your callback URL before calling `obtain_user_tokens`. For more information on state validation, [please see our documentation](https://auth0.com/docs/protocols/oauth2/oauth-state). 

Please note that this module implements endpoints that might be deprecated for newer tenants. If you have any questions about how and when the endpoints should be used, consult the [documentation](https://auth0.com/docs/api/authentication) or ask in our [Community forums](https://community.auth0.com/tags/wordpress).


## More Information

* [Login using OmniAuth](https://auth0.com/docs/quickstart/webapp/rails/01-login)
* [API authentication in Ruby](https://auth0.com/docs/quickstart/backend/ruby)
* [API authentication in Rails](https://auth0.com/docs/quickstart/backend/rails)
* [Managing authentication with Auth0 (blog)](https://auth0.com/blog/rails-5-with-auth0/)
* [Ruby on Rails workflow with Docker (blog)](https://auth0.com/blog/ruby-on-rails-killer-workflow-with-docker-part-1/)

## What is Auth0?

Auth0 helps you to:

* Add authentication with [multiple authentication sources](https://docs.auth0.com/identityproviders), either social like **Google, Facebook, Microsoft Account, LinkedIn, GitHub, Twitter, Box, Salesforce** among others, or enterprise identity systems like **Windows Azure AD, Google Apps, Active Directory, ADFS or any SAML Identity Provider**.
* Add authentication through more traditional **[username/password databases](https://docs.auth0.com/mysql-connection-tutorial)**.
* Add support for **[linking different user accounts](https://docs.auth0.com/link-accounts)** with the same user.
* Support for generating signed [JSON Web Tokens](https://docs.auth0.com/jwt) to call your APIs and **flow the user identity** securely.
* Analytics of how, when, and where users are logging in.
* Pull data from other sources and add it to the user profile with [JavaScript rules](https://docs.auth0.com/rules).

## Create a free Auth0 Account

1. Go to [Auth0](https://auth0.com) and click Sign Up.
2. Use Google, GitHub or Microsoft Account to login.

## Issue Reporting

If you find a bug or have a feature request, please report them in this repository's [Issues tab](https://github.com/auth0/ruby-auth0/issues). Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

## Author

[Auth0](https://auth0.com)

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file for more info.

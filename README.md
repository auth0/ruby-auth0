![ruby-auth0](https://cdn.auth0.com/website/sdks/banners/ruby-auth0-banner.png)

Ruby API client for the [Auth0](https://auth0.com) platform.

[![CircleCI](https://img.shields.io/circleci/project/github/auth0/ruby-auth0/master.svg)](https://circleci.com/gh/auth0/ruby-auth0)
[![Gem Version](https://badge.fury.io/rb/auth0.svg)](http://badge.fury.io/rb/auth0)
[![codecov](https://codecov.io/gh/auth0/ruby-auth0/branch/master/graph/badge.svg)](https://codecov.io/gh/auth0/ruby-auth0)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/auth0/ruby-auth0/master/frames)
[![MIT licensed](https://img.shields.io/dub/l/vibe-d.svg?style=flat)](https://github.com/auth0/ruby-auth0/blob/master/LICENSE)

<div>
📚 <a href="#documentation">Documentation</a> - 🚀 <a href="#getting-started">Getting started</a> - 💻 <a href="#api-reference">API reference</a> - 💬 <a href="#feedback">Feedback</a>
</div>

## Documentation

- [API documentation](https://www.rubydoc.info/gems/auth0) - documentation auto-generated from the code comments that explains all the available features
- [Examples](https://github.com/auth0/ruby-auth0/blob/master/EXAMPLES.md) - examples that demonstrate the different ways in which this SDK can be used
[FAQ](https://github.com/auth0/ruby-auth0/blob/master/FAQ.md) - frequently asked questions about the SDK
- [Docs Site](https://auth0.com/docs) - explore our Docs site and learn more about Auth0

## Getting Started

### Installation

This gem can be installed directly:

```bash
$ gem install auth0
```

or with [Bundler](https://bundler.io/man/bundle-add.1.html):

```bash
bundle add auth0
```

### Usage

Create an instance of `Auth0Client` to access properties and methods of the authentication and management APIs:

```ruby
require 'auth0'

client = Auth0Client.new(
  client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
  client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET'],
  domain: ENV['AUTH0_RUBY_DOMAIN'],
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
  # token_expires_at: Time.now.to_i + 86400
)
```

If `token` is omitted, the SDK will attempt to fetch a new token using the `client_credentials` grant, provided that `client_id` and `client_secret` are provided in the configuration. Once the token is about to expire (or has already expired), a new token will be fetched and cached for future calls.

For this to work, ensure your application can make a Client Credentials grant (Application settings in Auth0 > Advanced > Grant Types tab) and that the application is authorized for the Management API: https://auth0.com/docs/api-auth/config/using-the-auth0-dashboard

## Authentication API Client

This SDK provides access to [Authentication API](https://auth0.com/docs/api/authentication) endpoints with the `Auth0::API::AuthenticationEndpoints` module.

For basic login capability, we suggest using our OmniAuth stategy [detailed here](https://auth0.com/docs/quickstart/webapp/rails/01-login). Other authentication tasks currently supported are:

- Register a new user with a database connection using the `signup` method.
- Redirect a user to the universal login page for authentication using the `authorization_url` method.
- Log a user into a highly trusted app with the [Resource Owner Password grant](https://auth0.com/docs/api-auth/tutorials/password-grant) using the `login` method.
- Exchange an authorization code for an access token on callback using the `obtain_user_tokens` method (see the note on state validation below).
- Send a change password email to a database connection user using the `change_password` method.
- Log a user out of Auth0 with the `logout_url` method.

**Important note on state validation**: If you choose to implement a login flow callback yourself, it is important to generate and store a `state` value, pass that value to Auth0 in the `authorization_url` method, and validate it in your callback URL before calling `obtain_user_tokens`. For more information on state validation, [please see our documentation](https://auth0.com/docs/protocols/oauth2/oauth-state).

Please note that this module implements endpoints that might be deprecated for newer tenants. If you have any questions about how and when the endpoints should be used, consult the [documentation](https://auth0.com/docs/api/authentication) or ask in our [Community forums](https://community.auth0.com/tags/wordpress).

## Management API Client

This SDK provides access to the [Management API](https://auth0.com/docs/api/management/v2) via modules that help create clear and accurate calls. Most of the interaction is done through the `Auth0Client` class, instantiated with the required credentials.

For an example of using the management API client to read of users, see the [examples document](https://github.com/auth0/ruby-auth0/blob/master/EXAMPLES.md).

## Further reading

- [Login using OmniAuth](https://auth0.com/docs/quickstart/webapp/rails/01-login)
- [API authentication in Ruby](https://auth0.com/docs/quickstart/backend/ruby)
- [API authentication in Rails](https://auth0.com/docs/quickstart/backend/rails)
- [Managing authentication with Auth0 (blog)](https://auth0.com/blog/rails-5-with-auth0/)
- [Ruby on Rails workflow with Docker (blog)](https://auth0.com/blog/ruby-on-rails-killer-workflow-with-docker-part-1/)

## Feedback

### Contributing

We appreciate feedback and contribution to this repo! Before you get started, please see the following:

- [Auth0's general contribution guidelines](https://github.com/auth0/open-source-template/blob/master/GENERAL-CONTRIBUTING.md)
- [Auth0's code of conduct guidelines](https://github.com/auth0/open-source-template/blob/master/CODE-OF-CONDUCT.md)

### Raise an issue

To provide feedback or report a bug, please [raise an issue on our issue tracker](https://github.com/auth0/ruby-auth0/issues).

### Vulnerability Reporting

Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

---

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.auth0.com/website/sdks/logos/auth0_dark_mode.png" width="150">
    <source media="(prefers-color-scheme: light)" srcset="https://cdn.auth0.com/website/sdks/logos/auth0_light_mode.png" width="150">
    <img alt="Auth0 Logo" src="https://cdn.auth0.com/website/sdks/logos/auth0_light_mode.png" width="150">
  </picture>
</p>
<p align="center">
  Auth0 is an easy to implement, adaptable authentication and authorization platform. To learn more checkout <a href="https://auth0.com/why-auth0">Why Auth0?</a>
</p>
<p align="center">
  This project is licensed under the MIT license. See the <a href="https://github.com/auth0/ruby-auth0/blob/master/LICENSE"> LICENSE</a> file for more info.
</p>

Ruby api client for [Auth0](https://auth0.com) platform

[![Build Status](https://travis-ci.org/auth0/ruby-auth0.svg?branch=master)](https://travis-ci.org/auth0/ruby-auth0)
[![Gem Version](https://badge.fury.io/rb/auth0.svg)](http://badge.fury.io/rb/auth0)
[![Coverage Status](https://coveralls.io/repos/auth0/ruby-auth0/badge.svg?branch=master)](https://coveralls.io/r/auth0/ruby-auth0?branch=master)
[![Dependency Status](https://gemnasium.com/auth0/ruby-auth0.svg)](https://gemnasium.com/auth0/ruby-auth0)

## Installation

``` bash
$ gem install auth0
```

or with [Bundler](http://bundler.io)

```ruby
gem 'auth0'
```

## Basic usage

Using [APIv2](https://auth0.com/docs/api/v2)

```ruby
require "auth0"

auth0 = Auth0Client.new(
  :client_id => "YOUR CLIENT ID"
  :token => "YOUR JWT HERE",
  :domain => "<YOUR ACCOUNT>.auth0.com"  
)

puts auth0.get_users
```

Using [APIv1](https://auth0.com/docs/api/v1)

```ruby
require "auth0"

auth0 = Auth0Client.new(
  :client_id => "YOUR CLIENT ID",
  :client_secret => "YOUR CLIENT SECRET",
  :domain => "<YOUR ACCOUNT>.auth0.com",
  :api_version => "1"
)

puts auth0.get_users
```

### Timeout
You can setup a custom timeout in the Auth0Client. By default it is set to 10 minutes.

```ruby
require "auth0"

auth0 = Auth0Client.new(
  :client_id => "YOUR CLIENT ID"
  :token => "YOUR JWT HERE",
  :domain => "<YOUR ACCOUNT>.auth0.com",
  :timeout => 15
)

puts auth0.get_users
```

## API Documentation

Build API docs locally

``` bash
bundle exec rake documentation
```

To view API docs, go to `doc` folder and open `index.html`

## What is Auth0?

Auth0 helps you to:

* Add authentication with [multiple authentication sources](https://docs.auth0.com/identityproviders), either social like **Google, Facebook, Microsoft Account, LinkedIn, GitHub, Twitter, Box, Salesforce, amont others**, or enterprise identity systems like **Windows Azure AD, Google Apps, Active Directory, ADFS or any SAML Identity Provider**.
* Add authentication through more traditional **[username/password databases](https://docs.auth0.com/mysql-connection-tutorial)**.
* Add support for **[linking different user accounts](https://docs.auth0.com/link-accounts)** with the same user.
* Support for generating signed [Json Web Tokens](https://docs.auth0.com/jwt) to call your APIs and **flow the user identity** securely.
* Analytics of how, when and where users are logging in.
* Pull data from other sources and add it to the user profile, through [JavaScript rules](https://docs.auth0.com/rules).

## Create a free Auth0 Account

1. Go to [Auth0](https://auth0.com) and click Sign Up.
2. Use Google, GitHub or Microsoft Account to login.

## Issue Reporting

If you have found a bug or if you have a feature request, please report them at this repository issues section. Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

## Author

[Auth0](https://auth0.com)

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file for more info.

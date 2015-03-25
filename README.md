Ruby api client for [Auth0](https://auth0.com)

[![Build Status](https://travis-ci.org/auth0/ruby-auth0.svg?branch=master)](https://travis-ci.org/auth0/ruby-auth0)

## Installation

```
$ gem install auth0
```

## Basic usage

```ruby
require "auth0"

auth0 = Auth0Client.new(
  :client_id => "YOUR CLIENT ID",
  :client_secret => "YOUR CLIENT SECRET",
  :namespace => "<YOUR ACCOUNT>.auth0.com"
);

puts auth0.get_connections;
```

Using [APIv2](https://auth0.com/docs/apiv2)

```ruby
require "auth0"

auth0 = Auth0Client.new(
  :api_version => 2,
  :client_id => "YOUR CLIENT ID",
  :token => "YOUR JWT HERE",
  :namespace => "<YOUR ACCOUNT>.auth0.com"
);

puts auth0.get_users;
```


## Issue Reporting

If you have found a bug or if you have a feature request, please report them at this repository issues section. Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

## License

MIT 2014 - Auth0 Inc.

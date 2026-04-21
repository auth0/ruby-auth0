![ruby-auth0](https://cdn.auth0.com/website/sdks/banners/ruby-auth0-banner.png)

Ruby API client for the [Auth0](https://auth0.com) platform.

[![Gem Version](https://badge.fury.io/rb/auth0.svg)](http://badge.fury.io/rb/auth0)
[![MIT licensed](https://img.shields.io/dub/l/vibe-d.svg?style=flat)](https://github.com/auth0/ruby-auth0/blob/master/LICENSE)

<div>
  <a href="#documentation">Documentation</a> - <a href="#getting-started">Getting started</a> - <a href="#api-reference">API reference</a> - <a href="#feedback">Feedback</a>
</div>

## Documentation

- [API reference](./reference.md) - auto-generated reference for all Management API methods
- [Examples](./EXAMPLES.md) - examples that demonstrate the different ways in which this SDK can be used
- [Docs Site](https://auth0.com/docs) - explore our Docs site and learn more about Auth0

## Getting Started

### Installation

This gem can be installed directly:

```bash
gem install auth0
```

or with [Bundler](https://bundler.io/man/bundle-add.1.html):

```bash
bundle add auth0
```

### Usage

#### Unified Client (Authentication + Management)

Create an instance of `Auth0::Client` to access both the Authentication and Management APIs:

```ruby
require 'auth0'

client = Auth0::Client.new(
  client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
  client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET'],
  domain: ENV['AUTH0_RUBY_DOMAIN']
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
  # When passing a token, you can also specify when the token expires in seconds from epoch.
  # Otherwise, expiry is set by default to an hour from now.
  # token_expires_at: Time.now.to_i + 86400
)
```

If `token` is omitted, the SDK will attempt to fetch a new token using the `client_credentials` grant, provided that `client_id` and `client_secret` are provided in the configuration. Once the token is about to expire (or has already expired), a new token will be fetched and cached for future calls.

For this to work, ensure your application can make a Client Credentials grant (Application settings in Auth0 > Advanced > Grant Types tab) and that the application is authorized for the Management API: https://auth0.com/docs/api-auth/config/using-the-auth0-dashboard

You can also provide a custom token provider callable:

```ruby
client = Auth0::Client.new(
  domain: ENV['AUTH0_RUBY_DOMAIN'],
  token_provider: -> { fetch_token_from_my_vault() }
)
```

#### Configuration Reference

**Required:**

| Option | Type | Description | Default |
|--------|------|-------------|---------|
| `domain` | String | Your Auth0 tenant domain (e.g. `'example.auth0.com'`). Also accepts `namespace`. | — |

**Authentication (choose one):**

| Method | Options | Description |
|--------|---------|-------------|
| Client credentials | `client_id` + `client_secret` | Automatically fetches and refreshes Management API tokens via the client credentials grant. |
| Private key JWT | `client_id` + `client_assertion_signing_key` | Authenticates using a JWT signed with your private key instead of a client secret. Optionally set `client_assertion_signing_alg` (default: `'RS256'`). See [EXAMPLES.md](./EXAMPLES.md#use-a-private-key-to-authenticate-with-auth0). |
| Custom token provider | `token_provider` | A Proc/lambda that returns a token string. Called whenever a new token is needed. |
| Static token | `token` | A pre-obtained Management API token. Optionally set `token_expires_at` (seconds since epoch; defaults to 1 hour from now). Also accepts `access_token`. |

**Optional:**

| Option | Type | Description | Default |
|--------|------|-------------|---------|
| `organization` | String | Organization ID or name for organization-scoped authorization flows and ID token validation. See [EXAMPLES.md](./EXAMPLES.md#organizations). | `nil` |
| `api_identifier` | String | Custom audience for token requests. | `https://{domain}/api/v2/` |
| `timeout` | Integer | HTTP timeout in seconds for Authentication API calls. | `10` |
| `retry_count` | Integer | Number of retries for Authentication API calls. | `nil` |
| `management_timeout` | Float | Timeout in seconds for Management API calls. | `60` |
| `management_max_retries` | Integer | Maximum retries for Management API calls. | `2` |
| `management_additional_headers` | Hash | Additional HTTP headers for Management API calls. | `nil` |

#### Accessing the Management Client Directly

The underlying `Auth0::Management` instance is available via the `management` accessor. It is lazily created and automatically refreshed when the token changes:

```ruby
client = Auth0::Client.new(
  domain: ENV['AUTH0_RUBY_DOMAIN'],
  client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
  client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET']
)

# Access the Auth0::Management instance
management = client.management
management.users.list(per_page: 5)
```

`Auth0Client` is also available as a backward-compatible alias for `Auth0::Client`.

#### Management-Only Client

If you only need the Management API and already have a token, you can use `Auth0::Management` directly:

```ruby
require 'auth0'

management = Auth0::Management.new(
  token: ENV['AUTH0_MANAGEMENT_API_TOKEN'],
  base_url: 'https://YOUR_DOMAIN.auth0.com/api/v2'
)

# List users
management.users.list(q: 'email:*auth0*', per_page: 10)

# Create a role
management.roles.create(name: 'admin', description: 'Administrator role')
```

The `Auth0::Management` client also supports advanced options:

```ruby
management = Auth0::Management.new(
  token: 'YOUR_TOKEN',
  base_url: 'https://YOUR_DOMAIN.auth0.com/api/v2',
  timeout: 30,        # Request timeout in seconds (default: 60)
  max_retries: 3,     # Retry attempts for failed requests (default: 2)
  headers: {          # Additional headers to include in requests
    'X-Custom-Header' => 'custom-value'
  }
)
```

## Authentication API Client

This SDK provides access to [Authentication API](https://auth0.com/docs/api/authentication) endpoints with the `Auth0::Api::AuthenticationEndpoints` module, mixed into `Auth0::Client`.

For basic login capability, we suggest using our OmniAuth strategy [detailed here](https://auth0.com/docs/quickstart/webapp/rails/01-login). Other authentication tasks currently supported are:

- Register a new user with a database connection using the `signup` method.
- Redirect a user to the universal login page for authentication using the `authorization_url` method.
- Log a user into a highly trusted app with the [Resource Owner Password grant](https://auth0.com/docs/api-auth/tutorials/password-grant) using the `login` method.
- Exchange an authorization code for an access token on callback using the `obtain_user_tokens` method (see the note on state validation below).
- Send a change password email to a database connection user using the `change_password` method.
- Log a user out of Auth0 with the `logout_url` method.

**Important note on state validation**: If you choose to implement a login flow callback yourself, it is important to generate and store a `state` value, pass that value to Auth0 in the `authorization_url` method, and validate it in your callback URL before calling `obtain_user_tokens`. For more information on state validation, [please see our documentation](https://auth0.com/docs/protocols/oauth2/oauth-state).

Please note that this module implements endpoints that might be deprecated for newer tenants. If you have any questions about how and when the endpoints should be used, consult the [documentation](https://auth0.com/docs/api/authentication) or ask in our [Community forums](https://community.auth0.com/tags/wordpress).

## Management API Client

This SDK provides access to the [Management API](https://auth0.com/docs/api/management/v2) via a Fern-generated client with typed methods for each resource. Management methods are accessed through resource-specific sub-clients:

```ruby
# List users with a search query
users = client.users.list(
  q: 'email:*auth0*',
  fields: 'email,user_id,name',
  include_fields: true,
  page: 0,
  per_page: 50
)

# Get a specific user
user = client.users.get(id: 'auth0|123456')

# Create a new user
new_user = client.users.create(
  connection: 'Username-Password-Authentication',
  email: 'user@example.com',
  password: 'SecurePassword123!'
)

# Delete a user
client.users.delete(id: 'auth0|123456')
```

For more examples, see the [examples document](./EXAMPLES.md). For a full reference of all available Management API methods, see the [API reference](./reference.md).

## Advanced

### Retries

The Management API client is instrumented with automatic retries. A request will be retried as long as the request is deemed retryable and the number of retry attempts has not grown larger than the configured retry limit (default: 2).

A request is deemed retryable when any of the following HTTP status codes is returned:

- [408](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/408) (Timeout)
- [429](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429) (Too Many Requests)
- [5XX](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) (Internal Server Errors)

Configure retries on `Auth0::Client`:

```ruby
client = Auth0::Client.new(
  domain: ENV['AUTH0_RUBY_DOMAIN'],
  client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
  client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET'],
  management_max_retries: 3
)
```

Or on `Auth0::Management` directly:

```ruby
management = Auth0::Management.new(
  token: 'YOUR_TOKEN',
  base_url: 'https://YOUR_DOMAIN.auth0.com/api/v2',
  max_retries: 3
)
```

### Timeouts

The default timeout is 60 seconds. Configure on `Auth0::Client`:

```ruby
client = Auth0::Client.new(
  domain: ENV['AUTH0_RUBY_DOMAIN'],
  client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
  client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET'],
  management_timeout: 30
)
```

Or on `Auth0::Management` directly:

```ruby
management = Auth0::Management.new(
  token: 'YOUR_TOKEN',
  base_url: 'https://YOUR_DOMAIN.auth0.com/api/v2',
  timeout: 30
)
```

### Additional Headers

Send additional headers with management API requests:

```ruby
client = Auth0::Client.new(
  domain: ENV['AUTH0_RUBY_DOMAIN'],
  client_id: ENV['AUTH0_RUBY_CLIENT_ID'],
  client_secret: ENV['AUTH0_RUBY_CLIENT_SECRET'],
  management_additional_headers: { 'X-Custom-Header' => 'custom-value' }
)
```

You can also pass per-request headers using `request_options`:

```ruby
client.users.list(
  q: 'email:*auth0*',
  request_options: {
    additional_headers: { 'X-Custom-Header' => 'custom-value' }
  }
)
```

### Errors

Management API errors use the `Auth0::Errors` namespace:

```ruby
begin
  client.users.get(id: 'nonexistent')
rescue Auth0::Errors::TimeoutError
  puts "Request timed out"
rescue Auth0::Errors::ServiceUnavailableError
  puts "API returned 503"
rescue Auth0::Errors::ServerError
  puts "API returned a 5xx error"
rescue Auth0::Errors::ResponseError => e
  puts "Unexpected status: #{e.code} #{e.message}"
rescue Auth0::Errors::ApiError => e
  puts "API error: #{e.message}"
end
```

Authentication API errors use the `Auth0` namespace (e.g. `Auth0::BadRequest`, `Auth0::Unauthorized`).

## Further reading

- [Login using OmniAuth](https://auth0.com/docs/quickstart/webapp/rails/01-login)
- [API authentication in Ruby](https://auth0.com/docs/quickstart/backend/ruby)
- [API authentication in Rails](https://auth0.com/docs/quickstart/backend/rails)
- [Managing authentication with Auth0 (blog)](https://auth0.com/blog/rails-5-with-auth0/)

## Feedback

### Contributing

We appreciate feedback and contribution to this repo! Before you get started, please see the following:

- [Auth0's general contribution guidelines](https://github.com/auth0/open-source-template/blob/master/GENERAL-CONTRIBUTING.md)
- [Auth0's code of conduct guidelines](https://github.com/auth0/open-source-template/blob/master/CODE-OF-CONDUCT.md)

Note: The Management API client in this library is generated programmatically using [Fern](https://buildwithfern.com). Changes to Management API methods should be made in the Fern configuration, not directly in the generated code.

### Raise an issue

To provide feedback or report a bug, please [raise an issue on our issue tracker](https://github.com/auth0/ruby-auth0/issues).

### Vulnerability Reporting

Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

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
  This project is licensed under the MIT license. See the <a href="./LICENSE"> LICENSE</a> file for more info.
</p>

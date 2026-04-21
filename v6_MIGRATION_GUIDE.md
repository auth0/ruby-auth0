# V6 Migration Guide

A guide to migrating from `ruby-auth0` (v5.x) to `auth0-ruby-sdk` (v6.x).

- [Overview](#overview)
  - [Authentication API](#authentication-api)
  - [Management API](#management-api)
- [Auth0::Client Wrapper](#auth0client-wrapper)
  - [Client Credentials with Automatic Token Management](#client-credentials-with-automatic-token-management)
  - [Custom Token Provider](#custom-token-provider)
  - [Other Authentication Modes](#other-authentication-modes)
- [Breaking Changes](#breaking-changes)
  - [Gem Name](#gem-name)
  - [Client Initialization](#client-initialization)
  - [Resource Access Pattern](#resource-access-pattern)
  - [Method Name Changes](#method-name-changes)
  - [Sub-Resources Moved to Dedicated Sub-Clients](#sub-resources-moved-to-dedicated-sub-clients)
  - [Parameter Style](#parameter-style)
  - [Renamed Endpoints](#renamed-endpoints)
  - [Error Handling](#error-handling)
  - [Pagination](#pagination)
  - [Removed Methods](#removed-methods)
- [Migration Steps](#migration-steps)
- [Examples](#examples)
  - [User Management](#user-management)
  - [Role Management](#role-management)
  - [Organization Management](#organization-management)
  - [Connection Management](#connection-management)

## Overview

### Authentication API

This major version change does not affect the Authentication API. Any code written for the Authentication API in v5 should work in v6 with no changes. Methods like `signup`, `authorization_url`, `login`, `obtain_user_tokens`, `change_password`, `logout_url`, and `validate_id_token` are all unchanged.

### Management API

V6 introduces significant improvements to the Management API SDK by migrating to [Fern](https://github.com/fern-api/fern) as the code generation tool. This provides:

- **Generated from OpenAPI**: v6 is generated from Auth0's OpenAPI specifications, ensuring consistency and accuracy
- **Better Organization**: Sub-resources are organized into dedicated sub-clients (e.g., `client.users.roles` instead of `client.get_user_roles`)
- **Consistent Naming**: Methods follow a consistent pattern (`list`, `create`, `get`, `update`, `delete`)
- **Keyword Arguments**: All methods use keyword arguments instead of positional parameters
- **Enhanced Pagination**: Automatic pagination through iterator objects
- **Automatic Retries**: Built-in retry logic for transient failures (408, 429, 5xx)

## Auth0::Client Wrapper

In v5, `Auth0Client` handled both authentication and management through a single class that mixed in all API modules directly. In v6, the Management API is a separate Fern-generated `Auth0::Management` client.

`Auth0::Client` bridges the gap — it provides the same unified interface as v5, with authentication methods mixed in directly and management methods delegated to an internal `Auth0::Management` instance that is lazily created and automatically refreshed when the token changes.

### Client Credentials with Automatic Token Management

<table>
<tr>
<th>v5</th>
<th>v6</th>
</tr>
<tr>
<td>

```ruby
require 'auth0'

client = Auth0Client.new(
  client_id: 'YOUR_CLIENT_ID',
  client_secret: 'YOUR_CLIENT_SECRET',
  domain: 'tenant.auth0.com',
  api_version: 2
)

users = client.users(per_page: 10)
```

</td>
<td>

```ruby
require 'auth0'

client = Auth0::Client.new(
  client_id: 'YOUR_CLIENT_ID',
  client_secret: 'YOUR_CLIENT_SECRET',
  domain: 'tenant.auth0.com'
)

users = client.users.list(per_page: 10)
```

</td>
</tr>
</table>

Both versions automatically fetch a token via the client credentials grant, cache it, and re-fetch when it expires. `Auth0Client` remains available as a backward-compatible alias for `Auth0::Client`.

### Custom Token Provider

V6 adds a new `token_provider` option for supplying tokens from an external source:

```ruby
client = Auth0::Client.new(
  domain: 'tenant.auth0.com',
  token_provider: -> { MyVault.get_auth0_token }
)
```

The callable is invoked whenever a new token is needed (initial fetch or after expiry).

### Other Authentication Modes

```ruby
# Static token (same as v5)
client = Auth0::Client.new(
  domain: 'tenant.auth0.com',
  token: 'YOUR_MGMT_TOKEN'
)

# Management-only client (new in v6, no auth methods)
management = Auth0::Management.new(
  token: 'YOUR_MGMT_TOKEN',
  base_url: 'https://tenant.auth0.com/api/v2'
)
```

## Breaking Changes

### Gem Name

The gem name remains `auth0`, but the package has been regenerated. Update your Gemfile:

```ruby
# v5
gem 'auth0'  # sourced from ruby-auth0

# v6
gem 'auth0'  # sourced from auth0-ruby-sdk
```

### Client Initialization

The `api_version` parameter has been removed (v6 only supports Management API v2). The `namespace` parameter still works as an alias for `domain`.

<table>
<tr>
<th>v5</th>
<th>v6</th>
</tr>
<tr>
<td>

```ruby
client = Auth0Client.new(
  client_id: 'ID',
  client_secret: 'SECRET',
  domain: 'tenant.auth0.com',
  api_version: 2,
  timeout: 15
)
```

</td>
<td>

```ruby
client = Auth0::Client.new(
  client_id: 'ID',
  client_secret: 'SECRET',
  domain: 'tenant.auth0.com',
  management_timeout: 15
)
```

</td>
</tr>
</table>

Note: `timeout` still controls the Authentication API HTTP timeout. Use `management_timeout`, `management_max_retries`, and `management_additional_headers` to configure management API behavior.

### Resource Access Pattern

In v5, management methods were mixed directly into the client as top-level methods. In v6, they are accessed through resource-specific sub-clients:

```ruby
# v5 — methods directly on client
client.users(per_page: 10)
client.user('auth0|123')
client.create_user('Username-Password-Authentication', email: 'a@b.com')

# v6 — methods on sub-clients
client.users.list(per_page: 10)
client.users.get(id: 'auth0|123')
client.users.create(connection: 'Username-Password-Authentication', email: 'a@b.com')
```

### Method Name Changes

V6 uses a consistent naming convention across all resources. The old v5 method names (and their aliases) are replaced by standardized names:

| Pattern | v5 | v6 |
|---------|----|----|
| List all | `users(options)` / `get_users` | `users.list(**params)` |
| Get one | `user(id)` / `get_user` | `users.get(id:)` |
| Create | `create_user(conn, opts)` | `users.create(connection:, **opts)` |
| Update | `patch_user(id, body)` / `update_user` | `users.update(id:, **body)` |
| Delete | `delete_user(id)` | `users.delete(id:)` |

This pattern applies uniformly to all resources: `roles`, `connections`, `clients`, `organizations`, `rules`, `log_streams`, etc.

### Sub-Resources Moved to Dedicated Sub-Clients

In v5, sub-resource operations were methods on the parent client (e.g., `get_user_roles`). In v6, they are methods on dedicated sub-clients:

| v5 Method | v6 Method |
|-----------|-----------|
| `get_user_roles(user_id)` | `users.roles.list(id:)` |
| `add_user_roles(user_id, roles)` | `users.roles.assign(id:, roles:)` |
| `remove_user_roles(user_id, roles)` | `users.roles.delete(id:, roles:)` |
| `get_user_permissions(user_id)` | `users.permissions.list(id:)` |
| `add_user_permissions(user_id, perms)` | `users.permissions.create(id:, permissions:)` |
| `remove_user_permissions(user_id, perms)` | `users.permissions.delete(id:, permissions:)` |
| `user_logs(user_id)` | `users.logs.list(id:)` |
| `get_user_organizations(user_id)` | `users.organizations.list(id:)` |
| `get_enrollments(user_id)` | `users.enrollments.get(id:)` |
| `link_user_account(user_id, body)` | `users.identities.link(id:, **body)` |
| `unlink_user_account(user_id, provider, sec_id)` | `users.identities.delete(id:, provider:, user_id:)` |
| `user_authentication_methods(user_id)` | `users.authentication_methods.list(id:)` |
| `delete_user_authenticators(user_id)` | `users.authenticators.delete_all(id:)` |
| `invalidate_browsers(user_id)` | `users.multifactor.invalidate_remember_browser(id:)` |
| `delete_user_provider(user_id, provider)` | `users.multifactor.delete_provider(id:, provider:)` |
| `user_sessions(user_id)` | `users.sessions.list(id:)` |
| `delete_user_sessions(user_id)` | `users.sessions.delete(id:)` |
| `user_refresh_tokens(user_id)` | `users.refresh_token.list(id:)` |
| `generate_recovery_code(user_id)` | `users.regenerate_recovery_code(id:)` |
| `get_role_users(role_id)` | `roles.users.list(id:)` |
| `add_role_users(role_id, users)` | `roles.users.assign(id:, users:)` |
| `get_role_permissions(role_id)` | `roles.permissions.list(id:)` |
| `add_role_permissions(role_id, perms)` | `roles.permissions.add(id:, permissions:)` |
| `remove_role_permissions(role_id, perms)` | `roles.permissions.delete(id:, permissions:)` |
| `get_organizations_members(org_id)` | `organizations.members.list(id:)` |
| `create_organizations_members(org_id, members)` | `organizations.members.create(id:, members:)` |
| `delete_organizations_members(org_id, members)` | `organizations.members.delete(id:, members:)` |
| `get_organizations_member_roles(org_id, user_id)` | `organizations.members.roles.list(id:, user_id:)` |
| `create_organizations_member_roles(org_id, uid, roles)` | `organizations.members.roles.assign(id:, user_id:, roles:)` |
| `get_organizations_enabled_connections(org_id)` | `organizations.enabled_connections.list(id:)` |
| `create_organizations_enabled_connection(org_id, conn_id)` | `organizations.enabled_connections.add(id:, **body)` |
| `get_organizations_invites(org_id)` | `organizations.invitations.list(id:)` |
| `create_organizations_invite(org_id, options)` | `organizations.invitations.create(id:, **opts)` |
| `get_organizations_client_grants(org_id)` | `organizations.client_grants.list(id:)` |
| `client_credentials(client_id)` | `clients.credentials.list(id:)` |
| `create_client_credentials(client_id, opts)` | `clients.credentials.create(id:, **opts)` |
| `delete_client_credential(client_id, cred_id)` | `clients.credentials.delete(id:, credential_id:)` |

### Parameter Style

V5 used a mix of positional arguments and option hashes. V6 uses keyword arguments exclusively:

<table>
<tr>
<th>v5</th>
<th>v6</th>
</tr>
<tr>
<td>

```ruby
# Positional + options hash
client.create_user(
  'Username-Password-Authentication',
  email: 'user@example.com',
  password: 'Pass123!'
)

# Mixed positional + keyword
client.user('auth0|123', fields: 'email,name')

# Hash parameter
client.users(
  q: 'email:*auth0*',
  per_page: 10
)
```

</td>
<td>

```ruby
# All keyword arguments
client.users.create(
  connection: 'Username-Password-Authentication',
  email: 'user@example.com',
  password: 'Pass123!'
)

# All keyword arguments
client.users.get(id: 'auth0|123', fields: 'email,name')

# All keyword arguments
client.users.list(
  q: 'email:*auth0*',
  per_page: 10
)
```

</td>
</tr>
</table>

### Renamed Endpoints

Some top-level endpoint accessors have been renamed or reorganized:

| v5 Accessor | v6 Accessor | Notes |
|-------------|-------------|-------|
| `client.grants(...)` / `get_all_grants` | `client.user_grants.list(...)` | Renamed to `user_grants` |
| `client.users_by_email(email)` | `client.users.list_users_by_email(email:)` | Merged into Users |
| `client.blacklisted_tokens` | Removed | Use token revocation endpoints |
| `client.get_provider` / `configure_provider` | `client.emails.provider.get` / `create` | Moved under `emails.provider` |
| `client.get_tenant_settings` | `client.tenants.settings.get` | Moved under `tenants.settings` |
| `client.update_tenant_settings(body)` | `client.tenants.settings.update(**body)` | Moved under `tenants.settings` |
| `client.active_users` | `client.stats.get_active_users_count` | Moved under `stats` |
| `client.daily_stats(from, to)` | `client.stats.get_daily(from:, to:)` | Moved under `stats` |
| `client.post_email_verification(...)` | `client.tickets.verify_email(...)` | Moved under `tickets` |
| `client.post_password_change(...)` | `client.tickets.change_password(...)` | Moved under `tickets` |
| `client.prompts` / `get_prompts` | `client.prompts.get_settings` | Renamed |
| `client.patch_prompts(opts)` | `client.prompts.update_settings(**opts)` | Renamed |
| `client.custom_text(prompt, lang)` | `client.prompts.custom_text.get(prompt:, language:)` | Moved to sub-client |
| `client.put_custom_text(prompt, lang, body)` | `client.prompts.custom_text.set(prompt:, language:, **body)` | Moved to sub-client |
| `client.guardian_factors` | `client.guardian.factors.list` | Moved to sub-client |
| `client.guardian_enrollment(id)` | `client.guardian.enrollments.get(id:)` | Moved to sub-client |
| `client.check_if_ip_is_blocked(ip)` | `client.anomaly.blocks.check_ip(ip:)` | Moved to sub-client |
| `client.remove_ip_block(ip)` | `client.anomaly.blocks.unblock_ip(ip:)` | Moved to sub-client |
| `client.breached_password_detection` | `client.attack_protection.breached_password_detection.get` | Moved to sub-client |
| `client.brute_force_protection` | `client.attack_protection.brute_force_protection.get` | Moved to sub-client |
| `client.suspicious_ip_throttling` | `client.attack_protection.suspicious_ip_throttling.get` | Moved to sub-client |
| `client.branding` / `get_branding` | `client.branding.get` | Now a sub-client accessor |
| `client.branding_templates_for_universal_login` | `client.branding.templates.get_universal_login` | Moved to sub-client |

### Error Handling

V5 and v6 use different error class hierarchies for management API errors:

<table>
<tr>
<th>v5</th>
<th>v6</th>
</tr>
<tr>
<td>

```ruby
begin
  client.user('nonexistent')
rescue Auth0::NotFound => e
  puts "Not found: #{e.message}"
rescue Auth0::ServerError => e
  puts "Server error: #{e.message}"
rescue Auth0::BadRequest => e
  puts "Bad request: #{e.message}"
rescue Auth0::Exception => e
  puts "Auth0 error: #{e.message}"
end
```

</td>
<td>

```ruby
begin
  client.users.get(id: 'nonexistent')
rescue Auth0::Errors::NotFoundError => e
  puts "Not found: #{e.message}"
rescue Auth0::Errors::ClientError => e
  puts "Client error (4xx): #{e.message}"
rescue Auth0::Errors::ServerError => e
  puts "Server error (5xx): #{e.message}"
rescue Auth0::Errors::ApiError => e
  puts "API error: #{e.message}"
end
```

</td>
</tr>
</table>

> **Note:** Authentication API methods still raise the v5-style errors (`Auth0::BadRequest`, `Auth0::Unauthorized`, etc.) since the authentication module is ported from v5. Only management API methods use the new `Auth0::Errors::*` namespace.

### Pagination

V5 required manual pagination. V6 provides iterator objects that handle pagination automatically:

<table>
<tr>
<th>v5 Manual Pagination</th>
<th>v6 Automatic Pagination</th>
</tr>
<tr>
<td>

```ruby
page = 0
all_users = []

loop do
  response = client.users(
    page: page,
    per_page: 50,
    include_totals: true
  )

  all_users.concat(response['users'])
  break if all_users.length >= response['total']
  page += 1
end
```

</td>
<td>

```ruby
# Automatic pagination — just iterate
client.users.list(per_page: 50).each do |user|
  puts user[:email]
end
```

</td>
</tr>
</table>

### Removed Methods

The following v5 methods have been removed or replaced:

| v5 Method | v6 Alternative |
|-----------|---------------|
| `delete_users` (delete all users) | Removed — no equivalent (was dangerous) |
| `blacklisted_tokens` / `add_token_to_blacklist` | Removed — use token revocation |
| `delete_grant(id, user_id)` | `user_grants.delete(id:)` or `user_grants.delete_by_user_id(user_id:)` |
| `guardian_update_enrollment_verification_templates` | See `guardian.factors.sms` sub-clients |
| `guardian_twillo_provider_config` | `guardian.factors.phone.get_twilio_provider` |

## Migration Steps

### Step 1: Update Your Gemfile

```ruby
# Remove old gem
# gem 'auth0', '~> 5.0'

# Add new gem
gem 'auth0', '~> 6.0'
```

Then run `bundle install`.

### Step 2: Update Client Initialization

```ruby
# Old
client = Auth0Client.new(
  client_id: ENV['AUTH0_CLIENT_ID'],
  client_secret: ENV['AUTH0_CLIENT_SECRET'],
  domain: ENV['AUTH0_DOMAIN'],
  api_version: 2
)

# New
client = Auth0::Client.new(
  client_id: ENV['AUTH0_CLIENT_ID'],
  client_secret: ENV['AUTH0_CLIENT_SECRET'],
  domain: ENV['AUTH0_DOMAIN']
)
```

Remove any `api_version` parameters. Replace `timeout` with `management_timeout` if it was for management calls.

### Step 3: Update List/Get Method Calls

Search your codebase for direct method calls and update to the sub-client pattern:

```ruby
# Old                          # New
client.users(opts)              → client.users.list(**opts)
client.user(id)                 → client.users.get(id: id)
client.roles                    → client.roles.list
client.role(id)                 → client.roles.get(id: id)
client.connections(opts)        → client.connections.list(**opts)
client.connection(id)           → client.connections.get(id: id)
client.clients(opts)            → client.clients.list(**opts)
client.client(id)               → client.clients.get(id: id)
client.organizations(opts)      → client.organizations.list(**opts)
client.organization(id)         → client.organizations.get(id: id)
client.organization_by_name(n)  → client.organizations.get_by_name(name: n)
client.rules(opts)              → client.rules.list(**opts)
client.rule(id)                 → client.rules.get(id: id)
client.logs(opts)               → client.logs.list(**opts)
client.log(id)                  → client.logs.get(id: id)
client.log_streams              → client.log_streams.list
client.log_stream(id)           → client.log_streams.get(id: id)
```

### Step 4: Update Create/Update/Delete Calls

```ruby
# Old                                          # New
client.create_user(conn, opts)                   → client.users.create(connection: conn, **opts)
client.patch_user(id, body)                      → client.users.update(id: id, **body)
client.delete_user(id)                           → client.users.delete(id: id)
client.create_role(name, data)                   → client.roles.create(name: name, **data)
client.update_role(id, data)                     → client.roles.update(id: id, **data)
client.delete_role(id)                           → client.roles.delete(id: id)
client.create_connection(body)                   → client.connections.create(**body)
client.update_connection(id, body)               → client.connections.update(id: id, **body)
client.delete_connection(id)                     → client.connections.delete(id: id)
client.create_client(name, opts)                 → client.clients.create(name: name, **opts)
client.patch_client(id, opts)                    → client.clients.update(id: id, **opts)
client.delete_client(id)                         → client.clients.delete(id: id)
client.create_organization(opts)                 → client.organizations.create(**opts)
client.patch_organization(id, body)              → client.organizations.update(id: id, **body)
client.delete_organization(id)                   → client.organizations.delete(id: id)
```

### Step 5: Update Sub-Resource Calls

Replace flat sub-resource methods with sub-client calls:

```ruby
# Old                                                  # New
client.get_user_roles(user_id)                          → client.users.roles.list(id: user_id)
client.add_user_roles(user_id, roles)                   → client.users.roles.assign(id: user_id, roles: roles)
client.remove_user_roles(user_id, roles)                → client.users.roles.delete(id: user_id, roles: roles)
client.link_user_account(user_id, body)                 → client.users.identities.link(id: user_id, **body)
client.get_role_permissions(role_id)                     → client.roles.permissions.list(id: role_id)
client.get_organizations_members(org_id)                 → client.organizations.members.list(id: org_id)
client.create_organizations_members(org_id, members)     → client.organizations.members.create(id: org_id, members: members)
```

### Step 6: Update Error Handling

If you rescue management API errors, update the exception classes:

```ruby
# Old
rescue Auth0::NotFound
rescue Auth0::ServerError
rescue Auth0::BadRequest

# New (management API only)
rescue Auth0::Errors::NotFoundError
rescue Auth0::Errors::ServerError
rescue Auth0::Errors::ClientError
```

Authentication API errors (`Auth0::BadRequest`, `Auth0::Unauthorized`, etc.) are unchanged.

## Examples

### User Management

<table>
<tr>
<th>v5</th>
<th>v6</th>
</tr>
<tr>
<td>

```ruby
client = Auth0Client.new(
  client_id: 'ID',
  client_secret: 'SECRET',
  domain: 'tenant.auth0.com',
  api_version: 2
)

# Create
user = client.create_user(
  'Username-Password-Authentication',
  email: 'user@example.com',
  password: 'Pass123!'
)

# List
users = client.users(per_page: 10)

# Get
user = client.user('auth0|123')

# Update
client.patch_user('auth0|123',
  name: 'Updated Name'
)

# Delete
client.delete_user('auth0|123')

# Get user roles
roles = client.get_user_roles('auth0|123')

# Add roles
client.add_user_roles('auth0|123',
  ['rol_abc']
)

# Get user logs
logs = client.user_logs('auth0|123')

# Find by email
users = client.users_by_email('user@example.com')
```

</td>
<td>

```ruby
client = Auth0::Client.new(
  client_id: 'ID',
  client_secret: 'SECRET',
  domain: 'tenant.auth0.com'
)

# Create
user = client.users.create(
  connection: 'Username-Password-Authentication',
  email: 'user@example.com',
  password: 'Pass123!'
)

# List
users = client.users.list(per_page: 10)

# Get
user = client.users.get(id: 'auth0|123')

# Update
client.users.update(id: 'auth0|123',
  name: 'Updated Name'
)

# Delete
client.users.delete(id: 'auth0|123')

# Get user roles
roles = client.users.roles.list(id: 'auth0|123')

# Add roles
client.users.roles.assign(id: 'auth0|123',
  roles: ['rol_abc']
)

# Get user logs
logs = client.users.logs.list(id: 'auth0|123')

# Find by email
users = client.users.list_users_by_email(
  email: 'user@example.com'
)
```

</td>
</tr>
</table>

### Role Management

<table>
<tr>
<th>v5</th>
<th>v6</th>
</tr>
<tr>
<td>

```ruby
# Create
role = client.create_role('admin',
  description: 'Administrator'
)

# List
roles = client.get_roles(per_page: 10)

# Get
role = client.get_role('rol_abc')

# Update
client.update_role('rol_abc',
  description: 'Updated description'
)

# Delete
client.delete_role('rol_abc')

# Get permissions
perms = client.get_role_permissions('rol_abc')

# Add permissions
client.add_role_permissions('rol_abc', [
  {
    resource_server_identifier: 'api',
    permission_name: 'read:users'
  }
])

# Get users with role
users = client.get_role_users('rol_abc')
```

</td>
<td>

```ruby
# Create
role = client.roles.create(
  name: 'admin',
  description: 'Administrator'
)

# List
roles = client.roles.list(per_page: 10)

# Get
role = client.roles.get(id: 'rol_abc')

# Update
client.roles.update(id: 'rol_abc',
  description: 'Updated description'
)

# Delete
client.roles.delete(id: 'rol_abc')

# Get permissions
perms = client.roles.permissions.list(id: 'rol_abc')

# Add permissions
client.roles.permissions.add(id: 'rol_abc',
  permissions: [
    {
      resource_server_identifier: 'api',
      permission_name: 'read:users'
    }
  ]
)

# Get users with role
users = client.roles.users.list(id: 'rol_abc')
```

</td>
</tr>
</table>

### Organization Management

<table>
<tr>
<th>v5</th>
<th>v6</th>
</tr>
<tr>
<td>

```ruby
# Create
org = client.create_organization(
  name: 'acme-corp',
  display_name: 'Acme Corporation'
)

# List
orgs = client.organizations

# Get by name
org = client.organization_by_name('acme-corp')

# Get by ID
org = client.organization('org_abc')

# Update
client.patch_organization('org_abc',
  display_name: 'New Name'
)

# Add members
client.create_organizations_members(
  'org_abc', ['auth0|123']
)

# Get members
members = client.get_organizations_members('org_abc')

# Add member roles
client.create_organizations_member_roles(
  'org_abc', 'auth0|123', ['rol_abc']
)

# Enable connection
client.create_organizations_enabled_connection(
  'org_abc', 'con_abc'
)

# Create invitation
client.create_organizations_invite('org_abc',
  inviter: { name: 'Admin' },
  invitee: { email: 'user@example.com' },
  client_id: 'CLIENT_ID'
)

# Delete
client.delete_organization('org_abc')
```

</td>
<td>

```ruby
# Create
org = client.organizations.create(
  name: 'acme-corp',
  display_name: 'Acme Corporation'
)

# List
orgs = client.organizations.list

# Get by name
org = client.organizations.get_by_name(name: 'acme-corp')

# Get by ID
org = client.organizations.get(id: 'org_abc')

# Update
client.organizations.update(id: 'org_abc',
  display_name: 'New Name'
)

# Add members
client.organizations.members.create(
  id: 'org_abc', members: ['auth0|123']
)

# Get members
members = client.organizations.members.list(id: 'org_abc')

# Add member roles
client.organizations.members.roles.assign(
  id: 'org_abc', user_id: 'auth0|123', roles: ['rol_abc']
)

# Enable connection
client.organizations.enabled_connections.add(
  id: 'org_abc', connection_id: 'con_abc'
)

# Create invitation
client.organizations.invitations.create(id: 'org_abc',
  inviter: { name: 'Admin' },
  invitee: { email: 'user@example.com' },
  client_id: 'CLIENT_ID'
)

# Delete
client.organizations.delete(id: 'org_abc')
```

</td>
</tr>
</table>

### Connection Management

<table>
<tr>
<th>v5</th>
<th>v6</th>
</tr>
<tr>
<td>

```ruby
# Create
conn = client.create_connection(
  name: 'my-db',
  strategy: 'auth0',
  enabled_clients: ['CLIENT_ID']
)

# List
conns = client.connections(
  strategy: 'auth0',
  per_page: 10
)

# Get
conn = client.connection('con_abc')

# Update
client.update_connection('con_abc',
  display_name: 'My Database'
)

# Delete user from connection
client.delete_connection_user('con_abc',
  'user@example.com'
)

# Delete
client.delete_connection('con_abc')
```

</td>
<td>

```ruby
# Create
conn = client.connections.create(
  name: 'my-db',
  strategy: 'auth0',
  enabled_clients: ['CLIENT_ID']
)

# List
conns = client.connections.list(
  strategy: ['auth0'],
  per_page: 10
)

# Get
conn = client.connections.get(id: 'con_abc')

# Update
client.connections.update(id: 'con_abc',
  display_name: 'My Database'
)

# Delete user from connection
client.connections.users.delete_by_email(
  id: 'con_abc', email: 'user@example.com'
)

# Delete
client.connections.delete(id: 'con_abc')
```

</td>
</tr>
</table>

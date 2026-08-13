# Reference
## Actions
<details><summary><code>client.actions.<a href="/lib/auth0/actions/client.rb">list</a>() -> Auth0::Types::ListActionsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.list(
  trigger_id: "post-login",
  action_name: "actionName",
  deployed: true,
  page: 1,
  per_page: 1,
  installed: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**trigger_id:** `Auth0::Types::ActionTriggerTypeEnum` — An actions extensibility point.
    
</dd>
</dl>

<dl>
<dd>

**action_name:** `String` — The name of the action to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**deployed:** `Internal::Types::Boolean` — Optional filter to only retrieve actions that are deployed.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Use this field to request a specific page of the list results.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — The maximum number of results to be returned by the server in single response. 20 by default
    
</dd>
</dl>

<dl>
<dd>

**installed:** `Internal::Types::Boolean` — Optional. When true, return only installed actions. When false, return only custom actions. Returns all actions by default.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.<a href="/lib/auth0/actions/client.rb">create</a>(request) -> Auth0::Types::CreateActionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an action. Once an action is created, it must be deployed, and then bound to a trigger before it will be executed as part of a flow.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.create(
  name: "name",
  supported_triggers: [{
    id: "post-login"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — The name of an action.
    
</dd>
</dl>

<dl>
<dd>

**supported_triggers:** `Internal::Types::Array[Auth0::Types::ActionTrigger]` — The list of triggers that this action supports. At this time, an action can only target a single trigger at a time.
    
</dd>
</dl>

<dl>
<dd>

**code:** `String` — The source code of the action.
    
</dd>
</dl>

<dl>
<dd>

**dependencies:** `Internal::Types::Array[Auth0::Types::ActionVersionDependency]` — The list of third party npm modules, and their versions, that this action depends on.
    
</dd>
</dl>

<dl>
<dd>

**runtime:** `String` — The Node runtime. For example: `node22`, defaults to `node22`
    
</dd>
</dl>

<dl>
<dd>

**secrets:** `Internal::Types::Array[Auth0::Types::ActionSecretRequest]` — The list of secrets that are included in an action or a version of an action.
    
</dd>
</dl>

<dl>
<dd>

**modules:** `Internal::Types::Array[Auth0::Types::ActionModuleReference]` — The list of action modules and their versions used by this action.
    
</dd>
</dl>

<dl>
<dd>

**deploy:** `Internal::Types::Boolean` — True if the action should be deployed after creation.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.<a href="/lib/auth0/actions/client.rb">get</a>(id) -> Auth0::Types::GetActionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve an action by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the action to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.<a href="/lib/auth0/actions/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an action and all of its associated versions. An action must be unbound from all triggers before it can be deleted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.delete(
  id: "id",
  force: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the action to delete.
    
</dd>
</dl>

<dl>
<dd>

**force:** `Internal::Types::Boolean` — Force action deletion detaching bindings
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.<a href="/lib/auth0/actions/client.rb">update</a>(id, request) -> Auth0::Types::UpdateActionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an existing action. If this action is currently bound to a trigger, updating it will <strong>not</strong> affect any user flows until the action is deployed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the action to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — The name of an action.
    
</dd>
</dl>

<dl>
<dd>

**supported_triggers:** `Internal::Types::Array[Auth0::Types::ActionTrigger]` — The list of triggers that this action supports. At this time, an action can only target a single trigger at a time.
    
</dd>
</dl>

<dl>
<dd>

**code:** `String` — The source code of the action.
    
</dd>
</dl>

<dl>
<dd>

**dependencies:** `Internal::Types::Array[Auth0::Types::ActionVersionDependency]` — The list of third party npm modules, and their versions, that this action depends on.
    
</dd>
</dl>

<dl>
<dd>

**runtime:** `String` — The Node runtime. For example: `node22`, defaults to `node22`
    
</dd>
</dl>

<dl>
<dd>

**secrets:** `Internal::Types::Array[Auth0::Types::ActionSecretRequest]` — The list of secrets that are included in an action or a version of an action.
    
</dd>
</dl>

<dl>
<dd>

**modules:** `Internal::Types::Array[Auth0::Types::ActionModuleReference]` — The list of action modules and their versions used by this action.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.<a href="/lib/auth0/actions/client.rb">deploy</a>(id) -> Auth0::Types::DeployActionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deploy an action. Deploying an action will create a new immutable version of the action. If the action is currently bound to a trigger, then the system will begin executing the newly deployed version of the action immediately. Otherwise, the action will only be executed as a part of a flow once it is bound to that flow.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.deploy(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of an action.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.<a href="/lib/auth0/actions/client.rb">test</a>(id, request) -> Auth0::Types::TestActionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Test an action. After updating an action, it can be tested prior to being deployed to ensure it behaves as expected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.test(
  id: "id",
  payload: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the action to test.
    
</dd>
</dl>

<dl>
<dd>

**payload:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Branding
<details><summary><code>client.branding.<a href="/lib/auth0/branding/client.rb">get</a>() -> Auth0::Types::GetBrandingResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve branding settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Branding::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.<a href="/lib/auth0/branding/client.rb">update</a>(request) -> Auth0::Types::UpdateBrandingResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update branding settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**colors:** `Auth0::Types::UpdateBrandingColors` 
    
</dd>
</dl>

<dl>
<dd>

**favicon_url:** `String` — URL for the favicon. Must use HTTPS.
    
</dd>
</dl>

<dl>
<dd>

**logo_url:** `String` — URL for the logo. Must use HTTPS.
    
</dd>
</dl>

<dl>
<dd>

**font:** `Auth0::Types::UpdateBrandingFont` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ClientGrants
<details><summary><code>client.client_grants.<a href="/lib/auth0/client_grants/client.rb">list</a>() -> Auth0::Types::ListClientGrantPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of <a href="https://auth0.com/docs/get-started/applications/application-access-to-apis-client-grants">client grants</a>, including the scopes associated with the application/API pair.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.client_grants.list(
  from: "from",
  take: 1,
  audience: "audience",
  client_id: "client_id",
  allow_any_organization: true,
  subject_type: "client",
  default_for: "third_party_clients"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**audience:** `String` — Optional filter on audience.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — Optional filter on client_id.
    
</dd>
</dl>

<dl>
<dd>

**allow_any_organization:** `Internal::Types::Boolean` — Optional filter on allow_any_organization.
    
</dd>
</dl>

<dl>
<dd>

**subject_type:** `Auth0::Types::ClientGrantSubjectTypeEnum` — The type of application access the client grant allows.
    
</dd>
</dl>

<dl>
<dd>

**default_for:** `Auth0::Types::ClientGrantDefaultForEnum` — Used to filter the returned client grants to include only default client grants for the specified group of clients.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ClientGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.client_grants.<a href="/lib/auth0/client_grants/client.rb">create</a>(request) -> Auth0::Types::CreateClientGrantResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a client grant for a machine-to-machine login flow. To learn more, read <a href="https://www.auth0.com/docs/get-started/authentication-and-authorization-flow/client-credentials-flow">Client Credential Flow</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.client_grants.create(audience: "audience")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_id:** `String` — ID of the client.
    
</dd>
</dl>

<dl>
<dd>

**audience:** `String` — The audience (API identifier) of this client grant
    
</dd>
</dl>

<dl>
<dd>

**default_for:** `Auth0::Types::ClientGrantDefaultForEnum` — Applies this client grant as the default for all clients in the specified group. The only accepted value is `third_party_clients`, which applies the grant to all third-party clients. Per-client grants for the same audience take precedence. Mutually exclusive with `client_id`. If specified, a value for `client_id` must not be specified.
    
</dd>
</dl>

<dl>
<dd>

**organization_usage:** `Auth0::Types::ClientGrantOrganizationUsageEnum` 
    
</dd>
</dl>

<dl>
<dd>

**allow_any_organization:** `Internal::Types::Boolean` — If enabled, any organization can be used with this grant. If disabled (default), the grant must be explicitly assigned to the desired organizations.
    
</dd>
</dl>

<dl>
<dd>

**scope:** `Internal::Types::Array[String]` — Scopes allowed for this client grant.
    
</dd>
</dl>

<dl>
<dd>

**subject_type:** `Auth0::Types::ClientGrantSubjectTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**authorization_details_types:** `Internal::Types::Array[String]` — Types of authorization_details allowed for this client grant.
    
</dd>
</dl>

<dl>
<dd>

**allow_all_scopes:** `Internal::Types::Boolean` — If enabled, all scopes configured on the resource server are allowed for this grant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ClientGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.client_grants.<a href="/lib/auth0/client_grants/client.rb">get</a>(id) -> Auth0::Types::GetClientGrantResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a single <a href="https://auth0.com/docs/get-started/applications/application-access-to-apis-client-grants">client grant</a>, including the
scopes associated with the application/API pair.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.client_grants.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the client grant to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ClientGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.client_grants.<a href="/lib/auth0/client_grants/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete the <a href="https://www.auth0.com/docs/get-started/authentication-and-authorization-flow/client-credentials-flow">Client Credential Flow</a> from your machine-to-machine application.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.client_grants.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the client grant to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ClientGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.client_grants.<a href="/lib/auth0/client_grants/client.rb">update</a>(id, request) -> Auth0::Types::UpdateClientGrantResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a client grant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.client_grants.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the client grant to update.
    
</dd>
</dl>

<dl>
<dd>

**scope:** `Internal::Types::Array[String]` — Scopes allowed for this client grant.
    
</dd>
</dl>

<dl>
<dd>

**organization_usage:** `Auth0::Types::ClientGrantOrganizationNullableUsageEnum` 
    
</dd>
</dl>

<dl>
<dd>

**allow_any_organization:** `Internal::Types::Boolean` — Controls allowing any organization to be used with this grant
    
</dd>
</dl>

<dl>
<dd>

**authorization_details_types:** `Internal::Types::Array[String]` — Types of authorization_details allowed for this client grant.
    
</dd>
</dl>

<dl>
<dd>

**allow_all_scopes:** `Internal::Types::Boolean` — If enabled, all scopes configured on the resource server are allowed for this grant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ClientGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Clients
<details><summary><code>client.clients.<a href="/lib/auth0/clients/client.rb">list</a>() -> Auth0::Types::ListClientsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve clients (applications and SSO integrations) matching provided filters. A list of fields to include or exclude may also be specified.
For more information, read <a href="https://www.auth0.com/docs/get-started/applications"> Applications in Auth0</a> and <a href="https://www.auth0.com/docs/authenticate/single-sign-on"> Single Sign-On</a>.

<ul>
  <li>
    The following can be retrieved with any scope:
    <code>client_id</code>, <code>app_type</code>, <code>name</code>, and <code>description</code>.
  </li>
  <li>
    The following properties can only be retrieved with the <code>read:clients</code> or
    <code>read:client_keys</code> scope:
    <code>callbacks</code>, <code>oidc_logout</code>, <code>allowed_origins</code>,
    <code>web_origins</code>, <code>tenant</code>, <code>global</code>, <code>config_route</code>,
    <code>callback_url_template</code>, <code>jwt_configuration</code>,
    <code>jwt_configuration.lifetime_in_seconds</code>, <code>jwt_configuration.secret_encoded</code>,
    <code>jwt_configuration.scopes</code>, <code>jwt_configuration.alg</code>, <code>api_type</code>,
    <code>logo_uri</code>, <code>allowed_clients</code>, <code>owners</code>, <code>custom_login_page</code>,
    <code>custom_login_page_off</code>, <code>sso</code>, <code>addons</code>, <code>form_template</code>,
    <code>custom_login_page_codeview</code>, <code>resource_servers</code>, <code>client_metadata</code>,
    <code>mobile</code>, <code>mobile.android</code>, <code>mobile.ios</code>, <code>allowed_logout_urls</code>,
    <code>token_endpoint_auth_method</code>, <code>is_first_party</code>, <code>oidc_conformant</code>,
    <code>is_token_endpoint_ip_header_trusted</code>, <code>initiate_login_uri</code>, <code>grant_types</code>,
    <code>refresh_token</code>, <code>refresh_token.rotation_type</code>, <code>refresh_token.expiration_type</code>,
    <code>refresh_token.leeway</code>, <code>refresh_token.token_lifetime</code>, <code>refresh_token.policies</code>, <code>organization_usage</code>,
    <code>organization_require_behavior</code>.
  </li>
  <li>
    The following properties can only be retrieved with the
    <code>read:client_keys</code> or <code>read:client_credentials</code> scope:
    <code>encryption_key</code>, <code>encryption_key.pub</code>, <code>encryption_key.cert</code>,
    <code>client_secret</code>, <code>client_authentication_methods</code> and <code>signing_key</code>.
  </li>
</ul>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.list(
  fields: "fields",
  include_fields: true,
  page: 1,
  per_page: 1,
  include_totals: true,
  is_global: true,
  is_first_party: true,
  app_type: "app_type",
  external_client_id: "external_client_id",
  q: "q"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Default value is 50, maximum value is 100
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**is_global:** `Internal::Types::Boolean` — Optional filter on the global client parameter.
    
</dd>
</dl>

<dl>
<dd>

**is_first_party:** `Internal::Types::Boolean` — Optional filter on whether or not a client is a first-party client.
    
</dd>
</dl>

<dl>
<dd>

**app_type:** `String` — Optional filter by a comma-separated list of application types.
    
</dd>
</dl>

<dl>
<dd>

**external_client_id:** `String` — Optional filter by the <a href="https://www.ietf.org/archive/id/draft-ietf-oauth-client-id-metadata-document-04.html">Client ID Metadata Document</a> URI for CIMD-registered clients.
    
</dd>
</dl>

<dl>
<dd>

**q:** `String` — Advanced Query in <a href="https://lucene.apache.org/core/2_9_4/queryparsersyntax.html">Lucene</a> syntax.<br /><b>Permitted Queries</b>:<br /><ul><li><i>client_grant.organization_id:{organization_id}</i></li><li><i>client_grant.allow_any_organization:true</i></li></ul><b>Additional Restrictions</b>:<br /><ul><li>Cannot be used in combination with other filters</li><li>Requires use of the <i>from</i> and <i>take</i> paging parameters (checkpoint paginatinon)</li><li>Reduced rate limits apply. See <a href="https://auth0.com/docs/troubleshoot/customer-support/operational-policies/rate-limit-policy/rate-limit-configurations/enterprise-public">Rate Limit Configurations</a></li></ul><i><b>Note</b>: Recent updates may not be immediately reflected in query results</i>
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.<a href="/lib/auth0/clients/client.rb">create</a>(request) -> Auth0::Types::CreateClientResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new client (application or SSO integration). For more information, read <a href="https://www.auth0.com/docs/get-started/auth0-overview/create-applications">Create Applications</a>
<a href="https://www.auth0.com/docs/authenticate/single-sign-on/api-endpoints-for-single-sign-on>">API Endpoints for Single Sign-On</a>. 

Notes: 
- We recommend leaving the `client_secret` parameter unspecified to allow the generation of a safe secret.
- The <code>client_authentication_methods</code> and <code>token_endpoint_auth_method</code> properties are mutually exclusive. Use 
<code>client_authentication_methods</code> to configure the client with Private Key JWT authentication method. Otherwise, use <code>token_endpoint_auth_method</code>
to configure the client with client secret (basic or post) or with no authentication method (none).
- When using <code>client_authentication_methods</code> to configure the client with Private Key JWT authentication method, specify fully defined credentials. 
These credentials will be automatically enabled for Private Key JWT authentication on the client. 
- To configure <code>client_authentication_methods</code>, the <code>create:client_credentials</code> scope is required.
- To configure <code>client_authentication_methods</code>, the property <code>jwt_configuration.alg</code> must be set to RS256.

<div class="alert alert-warning">SSO Integrations created via this endpoint will accept login requests and share user profile information.</div>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.create(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Name of this client (min length: 1 character, does not allow `<` or `>`).
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Free text description of this client (max length: 140 characters).
    
</dd>
</dl>

<dl>
<dd>

**logo_uri:** `String` — URL of the logo to display for this client. Recommended size is 150x150 pixels.
    
</dd>
</dl>

<dl>
<dd>

**callbacks:** `Internal::Types::Array[String]` — Comma-separated list of URLs whitelisted for Auth0 to use as a callback to the client after authentication.
    
</dd>
</dl>

<dl>
<dd>

**oidc_logout:** `Auth0::Types::ClientOidcBackchannelLogoutSettings` 
    
</dd>
</dl>

<dl>
<dd>

**oidc_backchannel_logout:** `Auth0::Types::ClientOidcBackchannelLogoutSettings` — Configuration for OIDC backchannel logout (deprecated, in favor of oidc_logout)
    
</dd>
</dl>

<dl>
<dd>

**session_transfer:** `Auth0::Types::ClientSessionTransferConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**allowed_origins:** `Internal::Types::Array[String]` — Comma-separated list of URLs allowed to make requests from JavaScript to Auth0 API (typically used with CORS). By default, all your callback URLs will be allowed. This field allows you to enter other origins if necessary. You can also use wildcards at the subdomain level (e.g., https://*.contoso.com). Query strings and hash information are not taken into account when validating these URLs.
    
</dd>
</dl>

<dl>
<dd>

**web_origins:** `Internal::Types::Array[String]` — Comma-separated list of allowed origins for use with <a href='https://auth0.com/docs/cross-origin-authentication'>Cross-Origin Authentication</a>, <a href='https://auth0.com/docs/flows/concepts/device-auth'>Device Flow</a>, and <a href='https://auth0.com/docs/protocols/oauth2#how-response-mode-works'>web message response mode</a>.
    
</dd>
</dl>

<dl>
<dd>

**client_aliases:** `Internal::Types::Array[String]` — List of audiences/realms for SAML protocol. Used by the wsfed addon.
    
</dd>
</dl>

<dl>
<dd>

**allowed_clients:** `Internal::Types::Array[String]` — List of allow clients and API ids that are allowed to make delegation requests. Empty means all all your clients are allowed.
    
</dd>
</dl>

<dl>
<dd>

**allowed_logout_urls:** `Internal::Types::Array[String]` — Comma-separated list of URLs that are valid to redirect to after logout from Auth0. Wildcards are allowed for subdomains.
    
</dd>
</dl>

<dl>
<dd>

**grant_types:** `Internal::Types::Array[String]` — List of grant types supported for this application. Can include `authorization_code`, `implicit`, `refresh_token`, `client_credentials`, `password`, `http://auth0.com/oauth/grant-type/password-realm`, `http://auth0.com/oauth/grant-type/mfa-oob`, `http://auth0.com/oauth/grant-type/mfa-otp`, `http://auth0.com/oauth/grant-type/mfa-recovery-code`, `urn:openid:params:grant-type:ciba`, `urn:ietf:params:oauth:grant-type:device_code`, and `urn:auth0:params:oauth:grant-type:token-exchange:federated-connection-access-token`.
    
</dd>
</dl>

<dl>
<dd>

**token_endpoint_auth_method:** `Auth0::Types::ClientTokenEndpointAuthMethodEnum` 
    
</dd>
</dl>

<dl>
<dd>

**is_token_endpoint_ip_header_trusted:** `Internal::Types::Boolean` — If true, trust that the IP specified in the `auth0-forwarded-for` header is the end-user's IP for brute-force-protection on token endpoint.
    
</dd>
</dl>

<dl>
<dd>

**app_type:** `Auth0::Types::ClientAppTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**is_first_party:** `Internal::Types::Boolean` — Whether this client a first party client or not
    
</dd>
</dl>

<dl>
<dd>

**oidc_conformant:** `Internal::Types::Boolean` — Whether this client conforms to <a href='https://auth0.com/docs/api-auth/tutorials/adoption'>strict OIDC specifications</a> (true) or uses legacy features (false).
    
</dd>
</dl>

<dl>
<dd>

**jwt_configuration:** `Auth0::Types::ClientJwtConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**encryption_key:** `Auth0::Types::ClientEncryptionKey` 
    
</dd>
</dl>

<dl>
<dd>

**sso:** `Internal::Types::Boolean` — Applies only to SSO clients and determines whether Auth0 will handle Single Sign On (true) or whether the Identity Provider will (false).
    
</dd>
</dl>

<dl>
<dd>

**cross_origin_authentication:** `Internal::Types::Boolean` — Whether this client can be used to make cross-origin authentication requests (true) or it is not allowed to make such requests (false).
    
</dd>
</dl>

<dl>
<dd>

**cross_origin_loc:** `String` — URL of the location in your site where the cross origin verification takes place for the cross-origin auth flow when performing Auth in your own domain instead of Auth0 hosted login page.
    
</dd>
</dl>

<dl>
<dd>

**sso_disabled:** `Internal::Types::Boolean` — <code>true</code> to disable Single Sign On, <code>false</code> otherwise (default: <code>false</code>)
    
</dd>
</dl>

<dl>
<dd>

**custom_login_page_on:** `Internal::Types::Boolean` — <code>true</code> if the custom login page is to be used, <code>false</code> otherwise. Defaults to <code>true</code>
    
</dd>
</dl>

<dl>
<dd>

**custom_login_page:** `String` — The content (HTML, CSS, JS) of the custom login page.
    
</dd>
</dl>

<dl>
<dd>

**custom_login_page_preview:** `String` — The content (HTML, CSS, JS) of the custom login page. (Used on Previews)
    
</dd>
</dl>

<dl>
<dd>

**form_template:** `String` — HTML form template to be used for WS-Federation.
    
</dd>
</dl>

<dl>
<dd>

**addons:** `Auth0::Types::ClientAddons` 
    
</dd>
</dl>

<dl>
<dd>

**client_metadata:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**mobile:** `Auth0::Types::ClientMobile` 
    
</dd>
</dl>

<dl>
<dd>

**initiate_login_uri:** `String` — Initiate login uri, must be https
    
</dd>
</dl>

<dl>
<dd>

**native_social_login:** `Auth0::Types::NativeSocialLogin` 
    
</dd>
</dl>

<dl>
<dd>

**refresh_token:** `Auth0::Types::ClientRefreshTokenConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**default_organization:** `Auth0::Types::ClientDefaultOrganization` 
    
</dd>
</dl>

<dl>
<dd>

**organization_usage:** `Auth0::Types::ClientOrganizationUsageEnum` 
    
</dd>
</dl>

<dl>
<dd>

**organization_require_behavior:** `Auth0::Types::ClientOrganizationRequireBehaviorEnum` 
    
</dd>
</dl>

<dl>
<dd>

**organization_discovery_methods:** `Internal::Types::Array[Auth0::Types::ClientOrganizationDiscoveryEnum]` — Defines the available methods for organization discovery during the `pre_login_prompt`. Users can discover their organization either by `email`, `organization_name` or both.
    
</dd>
</dl>

<dl>
<dd>

**client_authentication_methods:** `Auth0::Types::ClientCreateAuthenticationMethod` 
    
</dd>
</dl>

<dl>
<dd>

**require_pushed_authorization_requests:** `Internal::Types::Boolean` — Makes the use of Pushed Authorization Requests mandatory for this client
    
</dd>
</dl>

<dl>
<dd>

**require_proof_of_possession:** `Internal::Types::Boolean` — Makes the use of Proof-of-Possession mandatory for this client
    
</dd>
</dl>

<dl>
<dd>

**signed_request_object:** `Auth0::Types::ClientSignedRequestObjectWithPublicKey` 
    
</dd>
</dl>

<dl>
<dd>

**compliance_level:** `Auth0::Types::ClientComplianceLevelEnum` 
    
</dd>
</dl>

<dl>
<dd>

**skip_non_verifiable_callback_uri_confirmation_prompt:** `Internal::Types::Boolean` 

Controls whether a confirmation prompt is shown during login flows when the redirect URI uses non-verifiable callback URIs (for example, a custom URI schema such as `myapp://`, or `localhost`).
If set to true, a confirmation prompt will not be shown. We recommend that this is set to false for improved protection from malicious apps.
See https://auth0.com/docs/secure/security-guidance/measures-against-app-impersonation for more information.
    
</dd>
</dl>

<dl>
<dd>

**token_exchange:** `Auth0::Types::ClientTokenExchangeConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**par_request_expiry:** `Integer` — Specifies how long, in seconds, a Pushed Authorization Request URI remains valid
    
</dd>
</dl>

<dl>
<dd>

**token_quota:** `Auth0::Types::CreateTokenQuota` 
    
</dd>
</dl>

<dl>
<dd>

**resource_server_identifier:** `String` — The identifier of the resource server that this client is linked to.
    
</dd>
</dl>

<dl>
<dd>

**third_party_security_mode:** `Auth0::Types::ClientThirdPartySecurityModeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**redirection_policy:** `Auth0::Types::ClientRedirectionPolicyEnum` 
    
</dd>
</dl>

<dl>
<dd>

**express_configuration:** `Auth0::Types::ExpressConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**my_organization_configuration:** `Auth0::Types::ClientMyOrganizationPostConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**async_approval_notification_channels:** `Internal::Types::Array[Auth0::Types::AsyncApprovalNotificationsChannelsEnum]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.<a href="/lib/auth0/clients/client.rb">preview_cimd_metadata</a>(request) -> Auth0::Types::PreviewCimdMetadataResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


      Fetches and validates a Client ID Metadata Document without creating a client.
      Returns the raw metadata and how it would be mapped to Auth0 client fields.
      This endpoint is useful for testing metadata URIs before creating CIMD clients.
    
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.preview_cimd_metadata(external_client_id: "external_client_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**external_client_id:** `String` — URL to the Client ID Metadata Document
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.<a href="/lib/auth0/clients/client.rb">register_cimd_client</a>(request) -> Auth0::Types::RegisterCimdClientResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


      Idempotent registration for Client ID Metadata Document (CIMD) clients.
      Uses external_client_id as the unique identifier for upsert operations.
      **Create:** Returns 201 when a new client is created (requires \
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.register_cimd_client(external_client_id: "external_client_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**external_client_id:** `String` — URL to the Client ID Metadata Document. Acts as the unique identifier for upsert operations.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.<a href="/lib/auth0/clients/client.rb">get</a>(id) -> Auth0::Types::GetClientResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve client details by ID. Clients are SSO connections or Applications linked with your Auth0 tenant. A list of fields to include or exclude may also be specified. 
For more information, read <a href="https://www.auth0.com/docs/get-started/applications"> Applications in Auth0</a> and <a href="https://www.auth0.com/docs/authenticate/single-sign-on"> Single Sign-On</a>.
<ul>
  <li>
    The following properties can be retrieved with any of the scopes:
    <code>client_id</code>, <code>app_type</code>, <code>name</code>, and <code>description</code>.
  </li>
  <li>
    The following properties can only be retrieved with the <code>read:clients</code> or
    <code>read:client_keys</code> scopes:
    <code>callbacks</code>, <code>oidc_logout</code>, <code>allowed_origins</code>,
    <code>web_origins</code>, <code>tenant</code>, <code>global</code>, <code>config_route</code>,
    <code>callback_url_template</code>, <code>jwt_configuration</code>,
    <code>jwt_configuration.lifetime_in_seconds</code>, <code>jwt_configuration.secret_encoded</code>,
    <code>jwt_configuration.scopes</code>, <code>jwt_configuration.alg</code>, <code>api_type</code>,
    <code>logo_uri</code>, <code>allowed_clients</code>, <code>owners</code>, <code>custom_login_page</code>,
    <code>custom_login_page_off</code>, <code>sso</code>, <code>addons</code>, <code>form_template</code>,
    <code>custom_login_page_codeview</code>, <code>resource_servers</code>, <code>client_metadata</code>,
    <code>mobile</code>, <code>mobile.android</code>, <code>mobile.ios</code>, <code>allowed_logout_urls</code>,
    <code>token_endpoint_auth_method</code>, <code>is_first_party</code>, <code>oidc_conformant</code>,
    <code>is_token_endpoint_ip_header_trusted</code>, <code>initiate_login_uri</code>, <code>grant_types</code>,
    <code>refresh_token</code>, <code>refresh_token.rotation_type</code>, <code>refresh_token.expiration_type</code>,
    <code>refresh_token.leeway</code>, <code>refresh_token.token_lifetime</code>, <code>refresh_token.policies</code>, <code>organization_usage</code>,
    <code>organization_require_behavior</code>.
  </li>
  <li>
    The following properties can only be retrieved with the <code>read:client_keys</code> or <code>read:client_credentials</code> scopes:
    <code>encryption_key</code>, <code>encryption_key.pub</code>, <code>encryption_key.cert</code>,
    <code>client_secret</code>, <code>client_authentication_methods</code> and <code>signing_key</code>.
  </li>
</ul>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.get(
  id: "id",
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the client to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.<a href="/lib/auth0/clients/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a client and related configuration (rules, connections, etc).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the client to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.<a href="/lib/auth0/clients/client.rb">update</a>(id, request) -> Auth0::Types::UpdateClientResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a client's settings. For more information, read <a href="https://www.auth0.com/docs/get-started/applications"> Applications in Auth0</a> and <a href="https://www.auth0.com/docs/authenticate/single-sign-on"> Single Sign-On</a>.

Notes:
- The `client_secret` and `signing_key` attributes can only be updated with the `update:client_keys` scope.
- The <code>client_authentication_methods</code> and <code>token_endpoint_auth_method</code> properties are mutually exclusive. Use <code>client_authentication_methods</code> to configure the client with Private Key JWT authentication method. Otherwise, use <code>token_endpoint_auth_method</code> to configure the client with client secret (basic or post) or with no authentication method (none).
- When using <code>client_authentication_methods</code> to configure the client with Private Key JWT authentication method, only specify the credential IDs that were generated when creating the credentials on the client.
- To configure <code>client_authentication_methods</code>, the <code>update:client_credentials</code> scope is required.
- To configure <code>client_authentication_methods</code>, the property <code>jwt_configuration.alg</code> must be set to RS256.
- To change a client's <code>is_first_party</code> property to <code>false</code>, the <code>organization_usage</code> and <code>organization_require_behavior</code> properties must be unset.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the client to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — The name of the client. Must contain at least one character. Does not allow '<' or '>'.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Free text description of the purpose of the Client. (Max character length: <code>140</code>)
    
</dd>
</dl>

<dl>
<dd>

**client_secret:** `String` — The secret used to sign tokens for the client
    
</dd>
</dl>

<dl>
<dd>

**logo_uri:** `String` — The URL of the client logo (recommended size: 150x150)
    
</dd>
</dl>

<dl>
<dd>

**callbacks:** `Internal::Types::Array[String]` — A set of URLs that are valid to call back from Auth0 when authenticating users
    
</dd>
</dl>

<dl>
<dd>

**oidc_logout:** `Auth0::Types::ClientOidcBackchannelLogoutSettings` 
    
</dd>
</dl>

<dl>
<dd>

**oidc_backchannel_logout:** `Auth0::Types::ClientOidcBackchannelLogoutSettings` — Configuration for OIDC backchannel logout (deprecated, in favor of oidc_logout)
    
</dd>
</dl>

<dl>
<dd>

**session_transfer:** `Auth0::Types::ClientSessionTransferConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**allowed_origins:** `Internal::Types::Array[String]` — A set of URLs that represents valid origins for CORS
    
</dd>
</dl>

<dl>
<dd>

**web_origins:** `Internal::Types::Array[String]` — A set of URLs that represents valid web origins for use with web message response mode
    
</dd>
</dl>

<dl>
<dd>

**grant_types:** `Internal::Types::Array[String]` — A set of grant types that the client is authorized to use. Can include `authorization_code`, `implicit`, `refresh_token`, `client_credentials`, `password`, `http://auth0.com/oauth/grant-type/password-realm`, `http://auth0.com/oauth/grant-type/mfa-oob`, `http://auth0.com/oauth/grant-type/mfa-otp`, `http://auth0.com/oauth/grant-type/mfa-recovery-code`, `urn:openid:params:grant-type:ciba`, `urn:ietf:params:oauth:grant-type:device_code`, and `urn:auth0:params:oauth:grant-type:token-exchange:federated-connection-access-token`.
    
</dd>
</dl>

<dl>
<dd>

**client_aliases:** `Internal::Types::Array[String]` — List of audiences for SAML protocol
    
</dd>
</dl>

<dl>
<dd>

**allowed_clients:** `Internal::Types::Array[String]` — Ids of clients that will be allowed to perform delegation requests. Clients that will be allowed to make delegation request. By default, all your clients will be allowed. This field allows you to specify specific clients
    
</dd>
</dl>

<dl>
<dd>

**allowed_logout_urls:** `Internal::Types::Array[String]` — URLs that are valid to redirect to after logout from Auth0
    
</dd>
</dl>

<dl>
<dd>

**jwt_configuration:** `Auth0::Types::ClientJwtConfiguration` — An object that holds settings related to how JWTs are created
    
</dd>
</dl>

<dl>
<dd>

**encryption_key:** `Auth0::Types::ClientEncryptionKey` — The client's encryption key
    
</dd>
</dl>

<dl>
<dd>

**sso:** `Internal::Types::Boolean` — <code>true</code> to use Auth0 instead of the IdP to do Single Sign On, <code>false</code> otherwise (default: <code>false</code>)
    
</dd>
</dl>

<dl>
<dd>

**cross_origin_authentication:** `Internal::Types::Boolean` — <code>true</code> if this client can be used to make cross-origin authentication requests, <code>false</code> otherwise if cross origin is disabled
    
</dd>
</dl>

<dl>
<dd>

**cross_origin_loc:** `String` — URL for the location in your site where the cross origin verification takes place for the cross-origin auth flow when performing Auth in your own domain instead of Auth0 hosted login page.
    
</dd>
</dl>

<dl>
<dd>

**sso_disabled:** `Internal::Types::Boolean` — <code>true</code> to disable Single Sign On, <code>false</code> otherwise (default: <code>false</code>)
    
</dd>
</dl>

<dl>
<dd>

**custom_login_page_on:** `Internal::Types::Boolean` — <code>true</code> if the custom login page is to be used, <code>false</code> otherwise.
    
</dd>
</dl>

<dl>
<dd>

**token_endpoint_auth_method:** `Auth0::Types::ClientTokenEndpointAuthMethodOrNullEnum` 
    
</dd>
</dl>

<dl>
<dd>

**is_token_endpoint_ip_header_trusted:** `Internal::Types::Boolean` — If true, trust that the IP specified in the `auth0-forwarded-for` header is the end-user's IP for brute-force-protection on token endpoint.
    
</dd>
</dl>

<dl>
<dd>

**app_type:** `Auth0::Types::ClientAppTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**is_first_party:** `Internal::Types::Boolean` — Whether this client a first party client or not
    
</dd>
</dl>

<dl>
<dd>

**oidc_conformant:** `Internal::Types::Boolean` — Whether this client will conform to strict OIDC specifications
    
</dd>
</dl>

<dl>
<dd>

**custom_login_page:** `String` — The content (HTML, CSS, JS) of the custom login page
    
</dd>
</dl>

<dl>
<dd>

**custom_login_page_preview:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**token_quota:** `Auth0::Types::UpdateTokenQuota` 
    
</dd>
</dl>

<dl>
<dd>

**form_template:** `String` — Form template for WS-Federation protocol
    
</dd>
</dl>

<dl>
<dd>

**addons:** `Auth0::Types::ClientAddons` 
    
</dd>
</dl>

<dl>
<dd>

**client_metadata:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**mobile:** `Auth0::Types::ClientMobile` — Configuration related to native mobile apps
    
</dd>
</dl>

<dl>
<dd>

**initiate_login_uri:** `String` — Initiate login uri, must be https
    
</dd>
</dl>

<dl>
<dd>

**native_social_login:** `Auth0::Types::NativeSocialLogin` 
    
</dd>
</dl>

<dl>
<dd>

**refresh_token:** `Auth0::Types::ClientRefreshTokenConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**default_organization:** `Auth0::Types::ClientDefaultOrganization` 
    
</dd>
</dl>

<dl>
<dd>

**organization_usage:** `Auth0::Types::ClientOrganizationUsagePatchEnum` 
    
</dd>
</dl>

<dl>
<dd>

**organization_require_behavior:** `Auth0::Types::ClientOrganizationRequireBehaviorPatchEnum` 
    
</dd>
</dl>

<dl>
<dd>

**organization_discovery_methods:** `Internal::Types::Array[Auth0::Types::ClientOrganizationDiscoveryEnum]` — Defines the available methods for organization discovery during the `pre_login_prompt`. Users can discover their organization either by `email`, `organization_name` or both.
    
</dd>
</dl>

<dl>
<dd>

**client_authentication_methods:** `Auth0::Types::ClientAuthenticationMethod` 
    
</dd>
</dl>

<dl>
<dd>

**require_pushed_authorization_requests:** `Internal::Types::Boolean` — Makes the use of Pushed Authorization Requests mandatory for this client
    
</dd>
</dl>

<dl>
<dd>

**require_proof_of_possession:** `Internal::Types::Boolean` — Makes the use of Proof-of-Possession mandatory for this client
    
</dd>
</dl>

<dl>
<dd>

**signed_request_object:** `Auth0::Types::ClientSignedRequestObjectWithCredentialID` 
    
</dd>
</dl>

<dl>
<dd>

**compliance_level:** `Auth0::Types::ClientComplianceLevelEnum` 
    
</dd>
</dl>

<dl>
<dd>

**skip_non_verifiable_callback_uri_confirmation_prompt:** `Internal::Types::Boolean` 

Controls whether a confirmation prompt is shown during login flows when the redirect URI uses non-verifiable callback URIs (for example, a custom URI schema such as `myapp://`, or `localhost`).
If set to true, a confirmation prompt will not be shown. We recommend that this is set to false for improved protection from malicious apps.
See https://auth0.com/docs/secure/security-guidance/measures-against-app-impersonation for more information.
    
</dd>
</dl>

<dl>
<dd>

**token_exchange:** `Auth0::Types::ClientTokenExchangeConfigurationOrNull` 
    
</dd>
</dl>

<dl>
<dd>

**par_request_expiry:** `Integer` — Specifies how long, in seconds, a Pushed Authorization Request URI remains valid
    
</dd>
</dl>

<dl>
<dd>

**express_configuration:** `Auth0::Types::ExpressConfigurationOrNull` 
    
</dd>
</dl>

<dl>
<dd>

**my_organization_configuration:** `Auth0::Types::ClientMyOrganizationPatchConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**async_approval_notification_channels:** `Internal::Types::Array[Auth0::Types::AsyncApprovalNotificationsChannelsEnum]` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_security_mode:** `Auth0::Types::ClientThirdPartySecurityModeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**redirection_policy:** `Auth0::Types::ClientRedirectionPolicyEnum` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.<a href="/lib/auth0/clients/client.rb">rotate_secret</a>(id) -> Auth0::Types::RotateClientSecretResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Rotate a client secret.

This endpoint cannot be used with clients configured with Private Key JWT authentication method (client_authentication_methods configured with private_key_jwt). The generated secret is NOT base64 encoded.

For more information, read <a href="https://www.auth0.com/docs/get-started/applications/rotate-client-secret">Rotate Client Secrets</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.rotate_secret(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the client that will rotate secrets.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ConnectionProfiles
<details><summary><code>client.connection_profiles.<a href="/lib/auth0/connection_profiles/client.rb">list</a>() -> Auth0::Types::ListConnectionProfilesPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of Connection Profiles. This endpoint supports Checkpoint pagination.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connection_profiles.list(
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 5.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ConnectionProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connection_profiles.<a href="/lib/auth0/connection_profiles/client.rb">create</a>(request) -> Auth0::Types::CreateConnectionProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a Connection Profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connection_profiles.create(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**organization:** `Auth0::Types::ConnectionProfileOrganization` 
    
</dd>
</dl>

<dl>
<dd>

**connection_name_prefix_template:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**enabled_features:** `Internal::Types::Array[Auth0::Types::EnabledFeaturesEnum]` 
    
</dd>
</dl>

<dl>
<dd>

**connection_config:** `Auth0::Types::ConnectionProfileConfig` 
    
</dd>
</dl>

<dl>
<dd>

**strategy_overrides:** `Auth0::Types::ConnectionProfileStrategyOverrides` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ConnectionProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connection_profiles.<a href="/lib/auth0/connection_profiles/client.rb">list_templates</a>() -> Auth0::Types::ListConnectionProfileTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of Connection Profile Templates.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connection_profiles.list_templates
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::ConnectionProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connection_profiles.<a href="/lib/auth0/connection_profiles/client.rb">get_template</a>(id) -> Auth0::Types::GetConnectionProfileTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a Connection Profile Template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connection_profiles.get_template(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the connection-profile-template to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ConnectionProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connection_profiles.<a href="/lib/auth0/connection_profiles/client.rb">get</a>(id) -> Auth0::Types::GetConnectionProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a single Connection Profile specified by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connection_profiles.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the connection-profile to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ConnectionProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connection_profiles.<a href="/lib/auth0/connection_profiles/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a single Connection Profile specified by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connection_profiles.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the connection-profile to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ConnectionProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connection_profiles.<a href="/lib/auth0/connection_profiles/client.rb">update</a>(id, request) -> Auth0::Types::UpdateConnectionProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the details of a specific Connection Profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connection_profiles.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the connection profile to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**organization:** `Auth0::Types::ConnectionProfileOrganization` 
    
</dd>
</dl>

<dl>
<dd>

**connection_name_prefix_template:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**enabled_features:** `Internal::Types::Array[Auth0::Types::EnabledFeaturesEnum]` 
    
</dd>
</dl>

<dl>
<dd>

**connection_config:** `Auth0::Types::ConnectionProfileConfig` 
    
</dd>
</dl>

<dl>
<dd>

**strategy_overrides:** `Auth0::Types::ConnectionProfileStrategyOverrides` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ConnectionProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Connections
<details><summary><code>client.connections.<a href="/lib/auth0/connections/client.rb">list</a>() -> Auth0::Types::ListConnectionsCheckpointPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves detailed list of all <a href="https://auth0.com/docs/authenticate/identity-providers">connections</a> that match the specified strategy. If no strategy is provided, all connections within your tenant are retrieved. This action can accept a list of fields to include or exclude from the resulting list of connections. 

This endpoint supports two types of pagination:
<ul>
<li>Offset pagination</li>
<li>Checkpoint pagination</li>
</ul>

Checkpoint pagination must be used if you need to retrieve more than 1000 connections.

<h2>Checkpoint Pagination</h2>

To search by checkpoint, use the following parameters:
<ul>
<li><code>from</code>: Optional id from which to start selection.</li>
<li><code>take</code>: The total amount of entries to retrieve when using the from parameter. Defaults to 50.</li>
</ul>

<b>Note</b>: The first time you call this endpoint using checkpoint pagination, omit the <code>from</code> parameter. If there are more results, a <code>next</code> value is included in the response. You can use this for subsequent API calls. When <code>next</code> is no longer included in the response, no pages are remaining.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.list(
  from: "from",
  take: 1,
  name: "name",
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**strategy:** `Auth0::Types::ConnectionStrategyEnum` — Provide strategies to only retrieve connections with such strategies
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Provide the name of the connection to retrieve
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — A comma separated list of fields to include or exclude (depending on include_fields) from the result, empty to retrieve all fields
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — <code>true</code> if the fields specified are to be included in the result, <code>false</code> otherwise (defaults to <code>true</code>)
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.<a href="/lib/auth0/connections/client.rb">create</a>(request) -> Auth0::Types::CreateConnectionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new connection according to the JSON object received in <code>body</code>.

<b>Note:</b> If a connection with the same name was recently deleted and had a large number of associated users, the deletion may still be processing. Creating a new connection with that name before the deletion completes may fail or produce unexpected results. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.create(
  name: "name",
  strategy: "ad"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — The name of the connection. Must start and end with an alphanumeric character and can only contain alphanumeric characters and '-'. Max length 128
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `String` — Connection name used in the new universal login experience
    
</dd>
</dl>

<dl>
<dd>

**strategy:** `Auth0::Types::ConnectionIdentityProviderEnum` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Auth0::Types::ConnectionPropertiesOptions` 
    
</dd>
</dl>

<dl>
<dd>

**enabled_clients:** `Internal::Types::Array[String]` — Use of this property is NOT RECOMMENDED. Use the PATCH /v2/connections/{id}/clients endpoint to enable the connection for a set of clients.
    
</dd>
</dl>

<dl>
<dd>

**is_domain_connection:** `Internal::Types::Boolean` — <code>true</code> promotes to a domain-level connection so that third-party applications can use it. <code>false</code> does not promote the connection, so only first-party applications with the connection enabled can use it. (Defaults to <code>false</code>.)
    
</dd>
</dl>

<dl>
<dd>

**show_as_button:** `Internal::Types::Boolean` — Enables showing a button for the connection in the login page (new experience only). If false, it will be usable only by HRD. (Defaults to <code>false</code>.)
    
</dd>
</dl>

<dl>
<dd>

**realms:** `Internal::Types::Array[String]` — Defines the realms for which the connection will be used (ie: email domains). If the array is empty or the property is not specified, the connection name will be added as realm.
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**authentication:** `Auth0::Types::ConnectionAuthenticationPurpose` 
    
</dd>
</dl>

<dl>
<dd>

**connected_accounts:** `Auth0::Types::ConnectionConnectedAccountsPurpose` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.<a href="/lib/auth0/connections/client.rb">get</a>(id) -> Auth0::Types::GetConnectionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details for a specified <a href="https://auth0.com/docs/authenticate/identity-providers">connection</a> along with options that can be used for identity provider configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.get(
  id: "id",
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to retrieve
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — A comma separated list of fields to include or exclude (depending on include_fields) from the result, empty to retrieve all fields
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — <code>true</code> if the fields specified are to be included in the result, <code>false</code> otherwise (defaults to <code>true</code>)
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.<a href="/lib/auth0/connections/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes a specific <a href="https://auth0.com/docs/authenticate/identity-providers">connection</a> from your tenant. This action cannot be undone. Once removed, users can no longer use this connection to authenticate.

<b>Note:</b> If your connection has a large amount of users associated with it, please be aware that this operation can be long running after the response is returned and may impact concurrent <a href="https://auth0.com/docs/api/management/v2/connections/post-connections">create connection</a> requests, if they use an identical connection name. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to delete
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.<a href="/lib/auth0/connections/client.rb">update</a>(id, request) -> Auth0::Types::UpdateConnectionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update details for a specific <a href="https://auth0.com/docs/authenticate/identity-providers">connection</a>, including option properties for identity provider configuration.

<b>Note</b>: If you use the <code>options</code> parameter, the entire <code>options</code> object is overriden. To avoid partial data or other issues, ensure all parameters are present when using this option.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to update
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `String` — The connection name used in the new universal login experience. If display_name is not included in the request, the field will be overwritten with the name value.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Auth0::Types::UpdateConnectionOptions` 
    
</dd>
</dl>

<dl>
<dd>

**enabled_clients:** `Internal::Types::Array[String]` — DEPRECATED property. Use the PATCH /v2/connections/{id}/clients endpoint to enable or disable the connection for any clients.
    
</dd>
</dl>

<dl>
<dd>

**is_domain_connection:** `Internal::Types::Boolean` — <code>true</code> promotes to a domain-level connection so that third-party applications can use it. <code>false</code> does not promote the connection, so only first-party applications with the connection enabled can use it. (Defaults to <code>false</code>.)
    
</dd>
</dl>

<dl>
<dd>

**show_as_button:** `Internal::Types::Boolean` — Enables showing a button for the connection in the login page (new experience only). If false, it will be usable only by HRD. (Defaults to <code>false</code>.)
    
</dd>
</dl>

<dl>
<dd>

**realms:** `Internal::Types::Array[String]` — Defines the realms for which the connection will be used (ie: email domains). If the array is empty or the property is not specified, the connection name will be added as realm.
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**authentication:** `Auth0::Types::ConnectionAuthenticationPurpose` 
    
</dd>
</dl>

<dl>
<dd>

**connected_accounts:** `Auth0::Types::ConnectionConnectedAccountsPurpose` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.<a href="/lib/auth0/connections/client.rb">check_status</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the status of an ad/ldap connection referenced by its <code>ID</code>. <code>200 OK</code> http status code response is returned  when the connection is online, otherwise a <code>404</code> status code is returned along with an error message
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.check_status(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the connection to check
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CustomDomains
<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">list</a>() -> Internal::Types::Array[Auth0::Types::CustomDomain]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details on <a href="https://auth0.com/docs/custom-domains">custom domains</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.list(
  q: "q",
  fields: "fields",
  include_fields: true,
  sort: "sort"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**q:** `String` — Query in <a href ="https://lucene.apache.org/core/2_9_4/queryparsersyntax.html">Lucene query string syntax</a>.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**sort:** `String` — Field to sort by. Only <code>domain:1</code> (ascending order by domain) is supported at this time.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">create</a>(request) -> Auth0::Types::CreateCustomDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new custom domain.

Note: The custom domain will need to be verified before it will accept
requests.

Optional attributes that can be updated:

- custom_client_ip_header
- tls_policy


TLS Policies:

- recommended - for modern usage this includes TLS 1.2 only
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.create(
  domain: "domain",
  type: "auth0_managed_certs"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domain:** `String` — Domain name.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Auth0::Types::CustomDomainProvisioningTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**verification_method:** `Auth0::Types::CustomDomainVerificationMethodEnum` 
    
</dd>
</dl>

<dl>
<dd>

**tls_policy:** `Auth0::Types::CustomDomainTLSPolicyEnum` 
    
</dd>
</dl>

<dl>
<dd>

**custom_client_ip_header:** `Auth0::Types::CustomDomainCustomClientIPHeaderEnum` 
    
</dd>
</dl>

<dl>
<dd>

**domain_metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**relying_party_identifier:** `String` — Relying Party ID (rpId) to be used for Passkeys on this custom domain. If not provided, the full domain will be used.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">get_default</a>() -> Auth0::Types::GetDefaultDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the tenant's default domain.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.get_default
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">set_default</a>(request) -> Auth0::Types::UpdateDefaultDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Set the default custom domain for the tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.set_default(domain: "domain")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domain:** `String` — The domain to set as the default custom domain. Must be a verified custom domain or the canonical domain.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">get</a>(id) -> Auth0::Types::GetCustomDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a custom domain configuration and status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the custom domain to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a custom domain and stop serving requests for it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the custom domain to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">update</a>(id, request) -> Auth0::Types::UpdateCustomDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a custom domain.

These are the attributes that can be updated:

- custom_client_ip_header
- tls_policy

<h5>Updating CUSTOM_CLIENT_IP_HEADER for a custom domain</h5>To update the <code>custom_client_ip_header</code> for a domain, the body to
send should be:
<pre><code>{ "custom_client_ip_header": "cf-connecting-ip" }</code></pre>

<h5>Updating TLS_POLICY for a custom domain</h5>To update the <code>tls_policy</code> for a domain, the body to send should be:
<pre><code>{ "tls_policy": "recommended" }</code></pre>


TLS Policies:

- recommended - for modern usage this includes TLS 1.2 only


Some considerations:

- The TLS ciphers and protocols available in each TLS policy follow industry recommendations, and may be updated occasionally.
- The <code>compatible</code> TLS policy is no longer supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the custom domain to update
    
</dd>
</dl>

<dl>
<dd>

**tls_policy:** `Auth0::Types::CustomDomainTLSPolicyEnum` — recommended includes TLS 1.2
    
</dd>
</dl>

<dl>
<dd>

**custom_client_ip_header:** `Auth0::Types::CustomDomainCustomClientIPHeaderEnum` 
    
</dd>
</dl>

<dl>
<dd>

**domain_metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**relying_party_identifier:** `String` — Relying Party ID (rpId) to be used for Passkeys on this custom domain. Set to null to remove the rpId and fall back to using the full domain.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">test</a>(id) -> Auth0::Types::TestCustomDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Run the test process on a custom domain.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.test(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the custom domain to test.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_domains.<a href="/lib/auth0/custom_domains/client.rb">verify</a>(id) -> Auth0::Types::VerifyCustomDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Run the verification process on a custom domain.

Note: Check the <code>status</code> field to see its verification status. Once verification is complete, it may take up to 10 minutes before the custom domain can start accepting requests.

For <code>self_managed_certs</code>, when the custom domain is verified for the first time, the response will also include the <code>cname_api_key</code> which you will need to configure your proxy. This key must be kept secret, and is used to validate the proxy requests.

<a href="https://auth0.com/docs/custom-domains#step-2-verify-ownership">Learn more</a> about verifying custom domains that use Auth0 Managed certificates.
<a href="https://auth0.com/docs/custom-domains/self-managed-certificates#step-2-verify-ownership">Learn more</a> about verifying custom domains that use Self Managed certificates.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_domains.verify(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the custom domain to verify.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::CustomDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## DeviceCredentials
<details><summary><code>client.device_credentials.<a href="/lib/auth0/device_credentials/client.rb">list</a>() -> Auth0::Types::ListDeviceCredentialsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve device credential information (<code>public_key</code>, <code>refresh_token</code>, or <code>rotating_refresh_token</code>) associated with a specific user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.device_credentials.list(
  page: 1,
  per_page: 1,
  include_totals: true,
  fields: "fields",
  include_fields: true,
  user_id: "user_id",
  client_id: "client_id",
  type: "public_key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.  There is a maximum of 1000 results allowed from this endpoint.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — user_id of the devices to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — client_id of the devices to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Auth0::Types::DeviceCredentialTypeEnum` — Type of credentials to retrieve. Must be `public_key`, `refresh_token` or `rotating_refresh_token`. The property will default to `refresh_token` when paging is requested
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::DeviceCredentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.device_credentials.<a href="/lib/auth0/device_credentials/client.rb">create_public_key</a>(request) -> Auth0::Types::CreatePublicKeyDeviceCredentialResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a device credential public key to manage refresh token rotation for a given <code>user_id</code>. Device Credentials APIs are designed for ad-hoc administrative use only and paging is by default enabled for GET requests.

When refresh token rotation is enabled, the endpoint becomes consistent. For more information, read <a href="https://auth0.com/docs/get-started/tenant-settings/signing-keys"> Signing Keys</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.device_credentials.create_public_key(
  device_name: "device_name",
  type: "public_key",
  value: "value",
  device_id: "device_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**device_name:** `String` — Name for this device easily recognized by owner.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Auth0::Types::DeviceCredentialPublicKeyTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**value:** `String` — Base64 encoded string containing the credential.
    
</dd>
</dl>

<dl>
<dd>

**device_id:** `String` — Unique identifier for the device. Recommend using <a href="http://developer.android.com/reference/android/provider/Settings.Secure.html#ANDROID_ID">Android_ID</a> on Android and <a href="https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/index.html#//apple_ref/occ/instp/UIDevice/identifierForVendor">identifierForVendor</a>.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — client_id of the client (application) this credential is for.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::DeviceCredentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.device_credentials.<a href="/lib/auth0/device_credentials/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete a device credential (such as a refresh token or public key) with the given ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.device_credentials.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the credential to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::DeviceCredentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EmailTemplates
<details><summary><code>client.email_templates.<a href="/lib/auth0/email_templates/client.rb">create</a>(request) -> Auth0::Types::CreateEmailTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an email template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.email_templates.create(template: "verify_email")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**template:** `Auth0::Types::EmailTemplateNameEnum` 
    
</dd>
</dl>

<dl>
<dd>

**body:** `String` — Body of the email template.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Senders `from` email address.
    
</dd>
</dl>

<dl>
<dd>

**result_url:** `String` — URL to redirect the user to after a successful action.
    
</dd>
</dl>

<dl>
<dd>

**subject:** `String` — Subject line of the email.
    
</dd>
</dl>

<dl>
<dd>

**syntax:** `String` — Syntax of the template body.
    
</dd>
</dl>

<dl>
<dd>

**url_lifetime_in_seconds:** `Integer` — Lifetime in seconds that the link within the email will be valid for.
    
</dd>
</dl>

<dl>
<dd>

**include_email_in_redirect:** `Internal::Types::Boolean` — Whether the `reset_email` and `verify_email` templates should include the user's email address as the `email` parameter in the returnUrl (true) or whether no email address should be included in the redirect (false). Defaults to true.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether the template is enabled (true) or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EmailTemplates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.email_templates.<a href="/lib/auth0/email_templates/client.rb">get</a>(template_name) -> Auth0::Types::GetEmailTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve an email template by pre-defined name. These names are `verify_email`, `verify_email_by_code`, `reset_email`, `reset_email_by_code`, `welcome_email`, `blocked_account`, `stolen_credentials`, `enrollment_email`, `mfa_oob_code`, `user_invitation`, and `async_approval`. The names `change_password`, and `password_reset` are also supported for legacy scenarios.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.email_templates.get(template_name: "verify_email")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**template_name:** `Auth0::Types::EmailTemplateNameEnum` — Template name. Can be `verify_email`, `verify_email_by_code`, `reset_email`, `reset_email_by_code`, `welcome_email`, `blocked_account`, `stolen_credentials`, `enrollment_email`, `mfa_oob_code`, `user_invitation`, `async_approval`, `change_password` (legacy), or `password_reset` (legacy).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EmailTemplates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.email_templates.<a href="/lib/auth0/email_templates/client.rb">set</a>(template_name, request) -> Auth0::Types::SetEmailTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an email template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.email_templates.set(
  template_name: "verify_email",
  template: "verify_email"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**template_name:** `Auth0::Types::EmailTemplateNameEnum` — Template name. Can be `verify_email`, `verify_email_by_code`, `reset_email`, `reset_email_by_code`, `welcome_email`, `blocked_account`, `stolen_credentials`, `enrollment_email`, `mfa_oob_code`, `user_invitation`, `async_approval`, `change_password` (legacy), or `password_reset` (legacy).
    
</dd>
</dl>

<dl>
<dd>

**template:** `Auth0::Types::EmailTemplateNameEnum` 
    
</dd>
</dl>

<dl>
<dd>

**body:** `String` — Body of the email template.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Senders `from` email address.
    
</dd>
</dl>

<dl>
<dd>

**result_url:** `String` — URL to redirect the user to after a successful action.
    
</dd>
</dl>

<dl>
<dd>

**subject:** `String` — Subject line of the email.
    
</dd>
</dl>

<dl>
<dd>

**syntax:** `String` — Syntax of the template body.
    
</dd>
</dl>

<dl>
<dd>

**url_lifetime_in_seconds:** `Integer` — Lifetime in seconds that the link within the email will be valid for.
    
</dd>
</dl>

<dl>
<dd>

**include_email_in_redirect:** `Internal::Types::Boolean` — Whether the `reset_email` and `verify_email` templates should include the user's email address as the `email` parameter in the returnUrl (true) or whether no email address should be included in the redirect (false). Defaults to true.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether the template is enabled (true) or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EmailTemplates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.email_templates.<a href="/lib/auth0/email_templates/client.rb">update</a>(template_name, request) -> Auth0::Types::UpdateEmailTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify an email template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.email_templates.update(template_name: "verify_email")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**template_name:** `Auth0::Types::EmailTemplateNameEnum` — Template name. Can be `verify_email`, `verify_email_by_code`, `reset_email`, `reset_email_by_code`, `welcome_email`, `blocked_account`, `stolen_credentials`, `enrollment_email`, `mfa_oob_code`, `user_invitation`, `async_approval`, `change_password` (legacy), or `password_reset` (legacy).
    
</dd>
</dl>

<dl>
<dd>

**template:** `Auth0::Types::EmailTemplateNameEnum` 
    
</dd>
</dl>

<dl>
<dd>

**body:** `String` — Body of the email template.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Senders `from` email address.
    
</dd>
</dl>

<dl>
<dd>

**result_url:** `String` — URL to redirect the user to after a successful action.
    
</dd>
</dl>

<dl>
<dd>

**subject:** `String` — Subject line of the email.
    
</dd>
</dl>

<dl>
<dd>

**syntax:** `String` — Syntax of the template body.
    
</dd>
</dl>

<dl>
<dd>

**url_lifetime_in_seconds:** `Integer` — Lifetime in seconds that the link within the email will be valid for.
    
</dd>
</dl>

<dl>
<dd>

**include_email_in_redirect:** `Internal::Types::Boolean` — Whether the `reset_email` and `verify_email` templates should include the user's email address as the `email` parameter in the returnUrl (true) or whether no email address should be included in the redirect (false). Defaults to true.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether the template is enabled (true) or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EmailTemplates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EventStreams
<details><summary><code>client.event_streams.<a href="/lib/auth0/event_streams/client.rb">list</a>() -> Auth0::Types::ListEventStreamsResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.list(
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.event_streams.<a href="/lib/auth0/event_streams/client.rb">create</a>(request) -> Auth0::Types::CreateEventStreamResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.create(destination: {
  type: "webhook",
  configuration: {
    webhook_endpoint: "webhook_endpoint",
    webhook_authorization: {
      method_: "basic",
      username: "username"
    }
  }
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Auth0::EventStreams::Types::EventStreamsCreateRequest` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.event_streams.<a href="/lib/auth0/event_streams/client.rb">get</a>(id) -> Auth0::Types::GetEventStreamResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the event stream.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.event_streams.<a href="/lib/auth0/event_streams/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the event stream.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.event_streams.<a href="/lib/auth0/event_streams/client.rb">update</a>(id, request) -> Auth0::Types::UpdateEventStreamResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the event stream.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Name of the event stream.
    
</dd>
</dl>

<dl>
<dd>

**subscriptions:** `Internal::Types::Array[Auth0::Types::EventStreamSubscription]` — List of event types subscribed to in this stream.
    
</dd>
</dl>

<dl>
<dd>

**destination:** `Auth0::Types::EventStreamDestinationPatch` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Auth0::Types::EventStreamStatusEnum` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.event_streams.<a href="/lib/auth0/event_streams/client.rb">test</a>(id, request) -> Auth0::Types::CreateEventStreamTestEventResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.test(
  id: "id",
  event_type: "group.created"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the event stream.
    
</dd>
</dl>

<dl>
<dd>

**event_type:** `Auth0::Types::EventStreamTestEventTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**data:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Flows
<details><summary><code>client.flows.<a href="/lib/auth0/flows/client.rb">list</a>() -> Auth0::Types::ListFlowsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.list(
  page: 1,
  per_page: 1,
  include_totals: true,
  synchronous: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**hydrate:** `Auth0::Types::ListFlowsRequestParametersHydrateEnum` — hydration param
    
</dd>
</dl>

<dl>
<dd>

**synchronous:** `Internal::Types::Boolean` — flag to filter by sync/async flows
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.<a href="/lib/auth0/flows/client.rb">create</a>(request) -> Auth0::Types::CreateFlowResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.create(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**actions:** `Internal::Types::Array[Auth0::Types::FlowAction]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.<a href="/lib/auth0/flows/client.rb">get</a>(id) -> Auth0::Types::GetFlowResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Flow identifier
    
</dd>
</dl>

<dl>
<dd>

**hydrate:** `Auth0::Types::GetFlowRequestParametersHydrateEnum` — hydration param
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.<a href="/lib/auth0/flows/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Flow id
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.<a href="/lib/auth0/flows/client.rb">update</a>(id, request) -> Auth0::Types::UpdateFlowResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Flow identifier
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**actions:** `Internal::Types::Array[Auth0::Types::FlowAction]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Forms
<details><summary><code>client.forms.<a href="/lib/auth0/forms/client.rb">list</a>() -> Auth0::Types::ListFormsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.forms.list(
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**hydrate:** `Auth0::Types::FormsRequestParametersHydrateEnum` — Query parameter to hydrate the response with additional data
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Forms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forms.<a href="/lib/auth0/forms/client.rb">create</a>(request) -> Auth0::Types::CreateFormResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.forms.create(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**messages:** `Auth0::Types::FormMessages` 
    
</dd>
</dl>

<dl>
<dd>

**languages:** `Auth0::Types::FormLanguages` 
    
</dd>
</dl>

<dl>
<dd>

**translations:** `Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]` 
    
</dd>
</dl>

<dl>
<dd>

**nodes:** `Internal::Types::Array[Auth0::Types::FormNode]` 
    
</dd>
</dl>

<dl>
<dd>

**start:** `Auth0::Types::FormStartNode` 
    
</dd>
</dl>

<dl>
<dd>

**ending:** `Auth0::Types::FormEndingNode` 
    
</dd>
</dl>

<dl>
<dd>

**style:** `Auth0::Types::FormStyle` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Forms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forms.<a href="/lib/auth0/forms/client.rb">get</a>(id) -> Auth0::Types::GetFormResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.forms.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the form to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**hydrate:** `Auth0::Types::FormsRequestParametersHydrateEnum` — Query parameter to hydrate the response with additional data
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Forms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forms.<a href="/lib/auth0/forms/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.forms.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the form to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Forms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forms.<a href="/lib/auth0/forms/client.rb">update</a>(id, request) -> Auth0::Types::UpdateFormResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.forms.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the form to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**messages:** `Auth0::Types::FormMessages` 
    
</dd>
</dl>

<dl>
<dd>

**languages:** `Auth0::Types::FormLanguages` 
    
</dd>
</dl>

<dl>
<dd>

**translations:** `Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]` 
    
</dd>
</dl>

<dl>
<dd>

**nodes:** `Internal::Types::Array[Auth0::Types::FormNode]` 
    
</dd>
</dl>

<dl>
<dd>

**start:** `Auth0::Types::FormStartNode` 
    
</dd>
</dl>

<dl>
<dd>

**ending:** `Auth0::Types::FormEndingNode` 
    
</dd>
</dl>

<dl>
<dd>

**style:** `Auth0::Types::FormStyle` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Forms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## UserGrants
<details><summary><code>client.user_grants.<a href="/lib/auth0/user_grants/client.rb">list</a>() -> Auth0::Types::ListUserGrantsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the <a href="https://auth0.com/docs/api-auth/which-oauth-flow-to-use">grants</a> associated with your account. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_grants.list(
  per_page: 1,
  page: 1,
  include_totals: true,
  user_id: "user_id",
  client_id: "client_id",
  audience: "audience"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — user_id of the grants to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — client_id of the grants to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**audience:** `String` — audience of the grants to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_grants.<a href="/lib/auth0/user_grants/client.rb">delete_by_user_id</a>() -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a grant associated with your account. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_grants.delete_by_user_id(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — user_id of the grant to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_grants.<a href="/lib/auth0/user_grants/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a grant associated with your account. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_grants.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the grant to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Groups
<details><summary><code>client.groups.<a href="/lib/auth0/groups/client.rb">list</a>() -> Auth0::Types::ListGroupsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all groups in your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.groups.list(
  connection_id: "connection_id",
  name: "name",
  external_id: "external_id",
  fields: "fields",
  include_fields: true,
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**connection_id:** `String` — Filter groups by connection ID.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Filter groups by name.
    
</dd>
</dl>

<dl>
<dd>

**external_id:** `String` — Filter groups by external ID.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — A comma separated list of fields to include or exclude (depending on include_fields) from the result, empty to retrieve all fields
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Groups::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.groups.<a href="/lib/auth0/groups/client.rb">get</a>(id) -> Auth0::Types::GetGroupResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a group by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.groups.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the group (service-generated).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Groups::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.groups.<a href="/lib/auth0/groups/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a group by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.groups.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the group (service-generated).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Groups::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Hooks
<details><summary><code>client.hooks.<a href="/lib/auth0/hooks/client.rb">list</a>() -> Auth0::Types::ListHooksOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all <a href="https://auth0.com/docs/hooks">hooks</a>. Accepts a list of fields to include or exclude in the result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.list(
  page: 1,
  per_page: 1,
  include_totals: true,
  enabled: true,
  fields: "fields",
  trigger_id: "credentials-exchange"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Optional filter on whether a hook is enabled (true) or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**trigger_id:** `Auth0::Types::HookTriggerIDEnum` — Retrieves hooks that match the trigger
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.hooks.<a href="/lib/auth0/hooks/client.rb">create</a>(request) -> Auth0::Types::CreateHookResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new hook.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.create(
  name: "name",
  script: "script",
  trigger_id: "credentials-exchange"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Name of this hook.
    
</dd>
</dl>

<dl>
<dd>

**script:** `String` — Code to be executed when this hook runs.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether this hook will be executed (true) or ignored (false).
    
</dd>
</dl>

<dl>
<dd>

**dependencies:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**trigger_id:** `Auth0::Types::HookTriggerIDEnum` — Execution stage of this rule. Can be `credentials-exchange`, `pre-user-registration`, `post-user-registration`, `post-change-password`, or `send-phone-message`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.hooks.<a href="/lib/auth0/hooks/client.rb">get</a>(id) -> Auth0::Types::GetHookResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve <a href="https://auth0.com/docs/hooks">a hook</a> by its ID. Accepts a list of fields to include in the result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.get(
  id: "id",
  fields: "fields"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the hook to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.hooks.<a href="/lib/auth0/hooks/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a hook.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the hook to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.hooks.<a href="/lib/auth0/hooks/client.rb">update</a>(id, request) -> Auth0::Types::UpdateHookResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an existing hook.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the hook to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Name of this hook.
    
</dd>
</dl>

<dl>
<dd>

**script:** `String` — Code to be executed when this hook runs.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether this hook will be executed (true) or ignored (false).
    
</dd>
</dl>

<dl>
<dd>

**dependencies:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Jobs
<details><summary><code>client.jobs.<a href="/lib/auth0/jobs/client.rb">get</a>(id) -> Auth0::Types::GetJobResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a job. Useful to check its status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.jobs.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the job.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Jobs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## LogStreams
<details><summary><code>client.log_streams.<a href="/lib/auth0/log_streams/client.rb">list</a>() -> Internal::Types::Array[Auth0::Types::LogStreamResponseSchema]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details on <a href="https://auth0.com/docs/logs/streams">log streams</a>.
<h5>Sample Response</h5><pre><code>[{
	"id": "string",
	"name": "string",
	"type": "eventbridge",
	"status": "active|paused|suspended",
	"sink": {
		"awsAccountId": "string",
		"awsRegion": "string",
		"awsPartnerEventSource": "string"
	}
}, {
	"id": "string",
	"name": "string",
	"type": "http",
	"status": "active|paused|suspended",
	"sink": {
		"httpContentFormat": "JSONLINES|JSONARRAY",
		"httpContentType": "string",
		"httpEndpoint": "string",
		"httpAuthorization": "string"
	}
},
{
	"id": "string",
	"name": "string",
	"type": "eventgrid",
	"status": "active|paused|suspended",
	"sink": {
		"azureSubscriptionId": "string",
		"azureResourceGroup": "string",
		"azureRegion": "string",
		"azurePartnerTopic": "string"
	}
},
{
	"id": "string",
	"name": "string",
	"type": "splunk",
	"status": "active|paused|suspended",
	"sink": {
		"splunkDomain": "string",
		"splunkToken": "string",
		"splunkPort": "string",
		"splunkSecure": "boolean"
	}
},
{
	"id": "string",
	"name": "string",
	"type": "sumo",
	"status": "active|paused|suspended",
	"sink": {
		"sumoSourceAddress": "string",
	}
},
{
	"id": "string",
	"name": "string",
	"type": "datadog",
	"status": "active|paused|suspended",
	"sink": {
		"datadogRegion": "string",
		"datadogApiKey": "string"
	}
}]</code></pre>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.log_streams.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::LogStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.log_streams.<a href="/lib/auth0/log_streams/client.rb">create</a>(request) -> Auth0::Types::CreateLogStreamResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a log stream.
<h5>Log Stream Types</h5> The <code>type</code> of log stream being created determines the properties required in the <code>sink</code> payload.
<h5>HTTP Stream</h5> For an <code>http</code> Stream, the <code>sink</code> properties are listed in the payload below
Request: <pre><code>{
	"name": "string",
	"type": "http",
	"sink": {
		"httpEndpoint": "string",
		"httpContentType": "string",
		"httpContentFormat": "JSONLINES|JSONARRAY",
		"httpAuthorization": "string"
	}
}</code></pre>
Response: <pre><code>{
	"id": "string",
	"name": "string",
	"type": "http",
	"status": "active",
	"sink": {
		"httpEndpoint": "string",
		"httpContentType": "string",
		"httpContentFormat": "JSONLINES|JSONARRAY",
		"httpAuthorization": "string"
	}
}</code></pre>
<h5>Amazon EventBridge Stream</h5> For an <code>eventbridge</code> Stream, the <code>sink</code> properties are listed in the payload below
Request: <pre><code>{
	"name": "string",
	"type": "eventbridge",
	"sink": {
		"awsRegion": "string",
		"awsAccountId": "string"
	}
}</code></pre>
The response will include an additional field <code>awsPartnerEventSource</code> in the <code>sink</code>: <pre><code>{
	"id": "string",
	"name": "string",
	"type": "eventbridge",
	"status": "active",
	"sink": {
		"awsAccountId": "string",
		"awsRegion": "string",
		"awsPartnerEventSource": "string"
	}
}</code></pre>
<h5>Azure Event Grid Stream</h5> For an <code>Azure Event Grid</code> Stream, the <code>sink</code> properties are listed in the payload below
Request: <pre><code>{
	"name": "string",
	"type": "eventgrid",
	"sink": {
		"azureSubscriptionId": "string",
		"azureResourceGroup": "string",
		"azureRegion": "string"
	}
}</code></pre>
Response: <pre><code>{
	"id": "string",
	"name": "string",
	"type": "http",
	"status": "active",
	"sink": {
		"azureSubscriptionId": "string",
		"azureResourceGroup": "string",
		"azureRegion": "string",
		"azurePartnerTopic": "string"
	}
}</code></pre>
<h5>Datadog Stream</h5> For a <code>Datadog</code> Stream, the <code>sink</code> properties are listed in the payload below
Request: <pre><code>{
	"name": "string",
	"type": "datadog",
	"sink": {
		"datadogRegion": "string",
		"datadogApiKey": "string"
	}
}</code></pre>
Response: <pre><code>{
	"id": "string",
	"name": "string",
	"type": "datadog",
	"status": "active",
	"sink": {
		"datadogRegion": "string",
		"datadogApiKey": "string"
	}
}</code></pre>
<h5>Splunk Stream</h5> For a <code>Splunk</code> Stream, the <code>sink</code> properties are listed in the payload below
Request: <pre><code>{
	"name": "string",
	"type": "splunk",
	"sink": {
		"splunkDomain": "string",
		"splunkToken": "string",
		"splunkPort": "string",
		"splunkSecure": "boolean"
	}
}</code></pre>
Response: <pre><code>{
	"id": "string",
	"name": "string",
	"type": "splunk",
	"status": "active",
	"sink": {
		"splunkDomain": "string",
		"splunkToken": "string",
		"splunkPort": "string",
		"splunkSecure": "boolean"
	}
}</code></pre>
<h5>Sumo Logic Stream</h5> For a <code>Sumo Logic</code> Stream, the <code>sink</code> properties are listed in the payload below
Request: <pre><code>{
	"name": "string",
	"type": "sumo",
	"sink": {
		"sumoSourceAddress": "string",
	}
}</code></pre>
Response: <pre><code>{
	"id": "string",
	"name": "string",
	"type": "sumo",
	"status": "active",
	"sink": {
		"sumoSourceAddress": "string",
	}
}</code></pre>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.log_streams.create(
  type: "http",
  sink: {
    http_endpoint: "httpEndpoint"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Auth0::Types::CreateLogStreamRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::LogStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.log_streams.<a href="/lib/auth0/log_streams/client.rb">get</a>(id) -> Auth0::Types::GetLogStreamResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a log stream configuration and status.
<h5>Sample responses</h5><h5>Amazon EventBridge Log Stream</h5><pre><code>{
	"id": "string",
	"name": "string",
	"type": "eventbridge",
	"status": "active|paused|suspended",
	"sink": {
		"awsAccountId": "string",
		"awsRegion": "string",
		"awsPartnerEventSource": "string"
	}
}</code></pre> <h5>HTTP Log Stream</h5><pre><code>{
	"id": "string",
	"name": "string",
	"type": "http",
	"status": "active|paused|suspended",
	"sink": {
		"httpContentFormat": "JSONLINES|JSONARRAY",
		"httpContentType": "string",
		"httpEndpoint": "string",
		"httpAuthorization": "string"
	}
}</code></pre> <h5>Datadog Log Stream</h5><pre><code>{
	"id": "string",
	"name": "string",
	"type": "datadog",
	"status": "active|paused|suspended",
	"sink": {
		"datadogRegion": "string",
		"datadogApiKey": "string"
	}

}</code></pre><h5>Mixpanel</h5>
	
	Request: <pre><code>{
	  "name": "string",
	  "type": "mixpanel",
	  "sink": {
		"mixpanelRegion": "string", // "us" | "eu",
		"mixpanelProjectId": "string",
		"mixpanelServiceAccountUsername": "string",
		"mixpanelServiceAccountPassword": "string"
	  }
	} </code></pre>
	
	
	Response: <pre><code>{
		"id": "string",
		"name": "string",
		"type": "mixpanel",
		"status": "active",
		"sink": {
		  "mixpanelRegion": "string", // "us" | "eu",
		  "mixpanelProjectId": "string",
		  "mixpanelServiceAccountUsername": "string",
		  "mixpanelServiceAccountPassword": "string" // the following is redacted on return
		}
	  } </code></pre>

	<h5>Segment</h5>

	Request: <pre><code> {
	  "name": "string",
	  "type": "segment",
	  "sink": {
		"segmentWriteKey": "string"
	  }
	}</code></pre>
	
	Response: <pre><code>{
	  "id": "string",
	  "name": "string",
	  "type": "segment",
	  "status": "active",
	  "sink": {
		"segmentWriteKey": "string"
	  }
	} </code></pre>
	
<h5>Splunk Log Stream</h5><pre><code>{
	"id": "string",
	"name": "string",
	"type": "splunk",
	"status": "active|paused|suspended",
	"sink": {
		"splunkDomain": "string",
		"splunkToken": "string",
		"splunkPort": "string",
		"splunkSecure": "boolean"
	}
}</code></pre> <h5>Sumo Logic Log Stream</h5><pre><code>{
	"id": "string",
	"name": "string",
	"type": "sumo",
	"status": "active|paused|suspended",
	"sink": {
		"sumoSourceAddress": "string",
	}
}</code></pre> <h5>Status</h5> The <code>status</code> of a log stream maybe any of the following:
1. <code>active</code> - Stream is currently enabled.
2. <code>paused</code> - Stream is currently user disabled and will not attempt log delivery.
3. <code>suspended</code> - Stream is currently disabled because of errors and will not attempt log delivery.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.log_streams.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the log stream to get
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::LogStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.log_streams.<a href="/lib/auth0/log_streams/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a log stream.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.log_streams.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the log stream to delete
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::LogStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.log_streams.<a href="/lib/auth0/log_streams/client.rb">update</a>(id, request) -> Auth0::Types::UpdateLogStreamResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a log stream.
<h4>Examples of how to use the PATCH endpoint.</h4> The following fields may be updated in a PATCH operation: <ul><li>name</li><li>status</li><li>sink</li></ul> Note: For log streams of type <code>eventbridge</code> and <code>eventgrid</code>, updating the <code>sink</code> is not permitted.
<h5>Update the status of a log stream</h5><pre><code>{
	"status": "active|paused"
}</code></pre>
<h5>Update the name of a log stream</h5><pre><code>{
	"name": "string"
}</code></pre>
<h5>Update the sink properties of a stream of type <code>http</code></h5><pre><code>{
  "sink": {
    "httpEndpoint": "string",
    "httpContentType": "string",
    "httpContentFormat": "JSONARRAY|JSONLINES",
    "httpAuthorization": "string"
  }
}</code></pre>
<h5>Update the sink properties of a stream of type <code>datadog</code></h5><pre><code>{
  "sink": {
		"datadogRegion": "string",
		"datadogApiKey": "string"
  }
}</code></pre>
<h5>Update the sink properties of a stream of type <code>splunk</code></h5><pre><code>{
  "sink": {
    "splunkDomain": "string",
    "splunkToken": "string",
    "splunkPort": "string",
    "splunkSecure": "boolean"
  }
}</code></pre>
<h5>Update the sink properties of a stream of type <code>sumo</code></h5><pre><code>{
  "sink": {
    "sumoSourceAddress": "string"
  }
}</code></pre> 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.log_streams.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the log stream to get
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — log stream name
    
</dd>
</dl>

<dl>
<dd>

**status:** `Auth0::Types::LogStreamStatusEnum` 
    
</dd>
</dl>

<dl>
<dd>

**is_priority:** `Internal::Types::Boolean` — True for priority log streams, false for non-priority
    
</dd>
</dl>

<dl>
<dd>

**filters:** `Internal::Types::Array[Auth0::Types::LogStreamFilter]` — Only logs events matching these filters will be delivered by the stream. If omitted or empty, all events will be delivered.
    
</dd>
</dl>

<dl>
<dd>

**pii_config:** `Auth0::Types::LogStreamPiiConfig` 
    
</dd>
</dl>

<dl>
<dd>

**sink:** `Auth0::Types::LogStreamSinkPatch` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::LogStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Logs
<details><summary><code>client.logs.<a href="/lib/auth0/logs/client.rb">list</a>() -> Auth0::Types::ListLogOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve log entries that match the specified search criteria (or all log entries if no criteria specified).

Set custom search criteria using the <code>q</code> parameter, or search from a specific log ID (<i>"search from checkpoint"</i>).

For more information on all possible event types, their respective acronyms, and descriptions, see <a href="https://auth0.com/docs/logs/log-event-type-codes">Log Event Type Codes</a>.

<h5>To set custom search criteria, use the following parameters:</h5>

<ul>
    <li><b>q:</b> Search Criteria using <a href="https://auth0.com/docs/logs/log-search-query-syntax">Query String Syntax</a></li>
    <li><b>page:</b> Page index of the results to return. First page is 0.</li>
    <li><b>per_page:</b> Number of results per page.</li>
    <li><b>sort:</b> Field to use for sorting appended with `:1` for ascending and `:-1` for descending. e.g. `date:-1`</li>
    <li><b>fields:</b> Comma-separated list of fields to include or exclude (depending on include_fields) from the result, empty to retrieve all fields.</li>
    <li><b>include_fields:</b> Whether specified fields are to be included (true) or excluded (false).</li>
    <li><b>include_totals:</b> Return results inside an object that contains the total result count (true) or as a direct array of results (false, default). <b>Deprecated:</b> this field is deprecated and should be removed from use. See <a href="https://auth0.com/docs/product-lifecycle/deprecations-and-migrations/migrate-to-tenant-log-search-v3#pagination">Search Engine V3 Breaking Changes</a></li>
</ul>

For more information on the list of fields that can be used in <code>fields</code> and <code>sort</code>, see <a href="https://auth0.com/docs/logs/log-search-query-syntax#searchable-fields">Searchable Fields</a>.

Auth0 <a href="https://auth0.com/docs/logs/retrieve-log-events-using-mgmt-api#limitations">limits the number of logs</a> you can return by search criteria to 100 logs per request. Furthermore, you may paginate only through 1,000 search results. If you exceed this threshold, please redefine your search or use the <a href="https://auth0.com/docs/logs/retrieve-log-events-using-mgmt-api#retrieve-logs-by-checkpoint">get logs by checkpoint method</a>.

<h5>To search from a checkpoint log ID, use the following parameters:</h5>
<ul>
    <li><b>from:</b> Log Event ID from which to start retrieving logs. You can limit the number of logs returned using the <code>take</code> parameter. If you use <code>from</code> at the same time as <code>q</code>, <code>from</code> takes precedence and <code>q</code> is ignored.</li>
    <li><b>take:</b> Number of entries to retrieve when using the <code>from</code> parameter.</li>
</ul>

<strong>Important:</strong> When fetching logs from a checkpoint log ID, any parameter other than <code>from</code> and <code>take</code> will be ignored, and date ordering is not guaranteed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.logs.list(
  page: 1,
  per_page: 1,
  sort: "sort",
  fields: "fields",
  include_fields: true,
  include_totals: true,
  search: "search"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` —  Number of results per page. Paging is disabled if parameter not sent. Default: <code>50</code>. Max value: <code>100</code>
    
</dd>
</dl>

<dl>
<dd>

**sort:** `String` — Field to use for sorting appended with <code>:1</code>  for ascending and <code>:-1</code> for descending. e.g. <code>date:-1</code>
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for <code>include_fields</code>) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (<code>true</code>) or excluded (<code>false</code>)
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results as an array when false (default). Return results inside an object that also contains a total result count when true.
    
</dd>
</dl>

<dl>
<dd>

**search:** `String` 

Retrieves logs that match the specified search criteria. This parameter can be combined with all the others in the /api/logs endpoint but is specified separately for clarity.
If no fields are provided a case insensitive 'starts with' search is performed on all of the following fields: client_name, connection, user_name. Otherwise, you can specify multiple fields and specify the search using the %field%:%search%, for example: application:node user:"John@contoso.com".
Values specified without quotes are matched using a case insensitive 'starts with' search. If quotes are used a case insensitve exact search is used. If multiple fields are used, the AND operator is used to join the clauses.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Logs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.logs.<a href="/lib/auth0/logs/client.rb">get</a>(id) -> Auth0::Types::GetLogResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve an individual log event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.logs.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — log_id of the log to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Logs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## NetworkACLs
<details><summary><code>client.network_acls.<a href="/lib/auth0/network_acls/client.rb">list</a>() -> Auth0::Types::ListNetworkACLsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all access control list entries for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.network_acls.list(
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Use this field to request a specific page of the list results.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — The amount of results per page.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::NetworkACLs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.network_acls.<a href="/lib/auth0/network_acls/client.rb">create</a>(request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new access control list for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.network_acls.create(
  description: "description",
  active: true,
  rule: {
    action: {},
    scope: "management"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**active:** `Internal::Types::Boolean` — Indicates whether or not this access control list is actively being used
    
</dd>
</dl>

<dl>
<dd>

**priority:** `Integer` — Indicates the order in which the ACL will be evaluated relative to other ACL rules.
    
</dd>
</dl>

<dl>
<dd>

**rule:** `Auth0::Types::NetworkACLRule` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::NetworkACLs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.network_acls.<a href="/lib/auth0/network_acls/client.rb">get</a>(id) -> Auth0::Types::GetNetworkACLsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a specific access control list entry for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.network_acls.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the access control list to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::NetworkACLs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.network_acls.<a href="/lib/auth0/network_acls/client.rb">set</a>(id, request) -> Auth0::Types::SetNetworkACLsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update existing access control list for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.network_acls.set(
  id: "id",
  description: "description",
  active: true,
  rule: {
    action: {},
    scope: "management"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the ACL to update.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**active:** `Internal::Types::Boolean` — Indicates whether or not this access control list is actively being used
    
</dd>
</dl>

<dl>
<dd>

**priority:** `Integer` — Indicates the order in which the ACL will be evaluated relative to other ACL rules.
    
</dd>
</dl>

<dl>
<dd>

**rule:** `Auth0::Types::NetworkACLRule` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::NetworkACLs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.network_acls.<a href="/lib/auth0/network_acls/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete existing access control list for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.network_acls.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the ACL to delete
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::NetworkACLs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.network_acls.<a href="/lib/auth0/network_acls/client.rb">update</a>(id, request) -> Auth0::Types::UpdateNetworkACLResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update existing access control list for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.network_acls.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the ACL to update.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**active:** `Internal::Types::Boolean` — Indicates whether or not this access control list is actively being used
    
</dd>
</dl>

<dl>
<dd>

**priority:** `Integer` — Indicates the order in which the ACL will be evaluated relative to other ACL rules.
    
</dd>
</dl>

<dl>
<dd>

**rule:** `Auth0::Types::NetworkACLRule` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::NetworkACLs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Organizations
<details><summary><code>client.organizations.<a href="/lib/auth0/organizations/client.rb">list</a>() -> Auth0::Types::ListOrganizationsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed list of all Organizations available in your tenant. For more information, see Auth0 Organizations.

This endpoint supports two types of pagination:
<ul>
<li>Offset pagination</li>
<li>Checkpoint pagination</li>
</ul>

Checkpoint pagination must be used if you need to retrieve more than 1000 organizations.

<h2>Checkpoint Pagination</h2>

To search by checkpoint, use the following parameters:
<ul>
<li><code>from</code>: Optional id from which to start selection.</li>
<li><code>take</code>: The total number of entries to retrieve when using the <code>from</code> parameter. Defaults to 50.</li>
</ul>

<b>Note</b>: The first time you call this endpoint using checkpoint pagination, omit the <code>from</code> parameter. If there are more results, a <code>next</code> value is included in the response. You can use this for subsequent API calls. When <code>next</code> is no longer included in the response, no pages are remaining.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.list(
  from: "from",
  take: 1,
  sort: "sort"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `String` — Field to sort by. Use <code>field:order</code> where order is <code>1</code> for ascending and <code>-1</code> for descending. e.g. <code>created_at:1</code>. We currently support sorting by the following fields: <code>name</code>, <code>display_name</code> and <code>created_at</code>.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.<a href="/lib/auth0/organizations/client.rb">create</a>(request) -> Auth0::Types::CreateOrganizationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new Organization within your tenant.  To learn more about Organization settings, behavior, and configuration options, review <a href="https://auth0.com/docs/manage-users/organizations/create-first-organization">Create Your First Organization</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.create(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — The name of this organization.
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `String` — Friendly name of this organization.
    
</dd>
</dl>

<dl>
<dd>

**branding:** `Auth0::Types::OrganizationBranding` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**enabled_connections:** `Internal::Types::Array[Auth0::Types::ConnectionForOrganization]` — Connections that will be enabled for this organization. See POST enabled_connections endpoint for the object format. (Max of 10 connections allowed)
    
</dd>
</dl>

<dl>
<dd>

**token_quota:** `Auth0::Types::CreateTokenQuota` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.<a href="/lib/auth0/organizations/client.rb">get_by_name</a>(name) -> Auth0::Types::GetOrganizationByNameResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a single Organization specified by name.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.get_by_name(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — name of the organization to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.<a href="/lib/auth0/organizations/client.rb">get</a>(id) -> Auth0::Types::GetOrganizationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a single Organization specified by ID. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the organization to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.<a href="/lib/auth0/organizations/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove an Organization from your tenant.  This action cannot be undone. 

<b>Note</b>: Members are automatically disassociated from an Organization when it is deleted. However, this action does <b>not</b> delete these users from your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.<a href="/lib/auth0/organizations/client.rb">update</a>(id, request) -> Auth0::Types::UpdateOrganizationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the details of a specific <a href="https://auth0.com/docs/manage-users/organizations/configure-organizations/create-organizations">Organization</a>, such as name and display name, branding options, and metadata.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the organization to update.
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `String` — Friendly name of this organization.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — The name of this organization.
    
</dd>
</dl>

<dl>
<dd>

**branding:** `Auth0::Types::OrganizationBranding` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**token_quota:** `Auth0::Types::UpdateTokenQuota` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Prompts
<details><summary><code>client.prompts.<a href="/lib/auth0/prompts/client.rb">get_settings</a>() -> Auth0::Types::GetSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the Universal Login configuration of your tenant. This includes the <a href="https://auth0.com/docs/authenticate/login/auth0-universal-login/identifier-first">Identifier First Authentication</a> and <a href="https://auth0.com/docs/secure/multi-factor-authentication/fido-authentication-with-webauthn/configure-webauthn-device-biometrics-for-mfa">WebAuthn with Device Biometrics for MFA</a> features.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.get_settings
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Prompts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.prompts.<a href="/lib/auth0/prompts/client.rb">update_settings</a>(request) -> Auth0::Types::UpdateSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the Universal Login configuration of your tenant. This includes the <a href="https://auth0.com/docs/authenticate/login/auth0-universal-login/identifier-first">Identifier First Authentication</a> and <a href="https://auth0.com/docs/secure/multi-factor-authentication/fido-authentication-with-webauthn/configure-webauthn-device-biometrics-for-mfa">WebAuthn with Device Biometrics for MFA</a> features.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.update_settings
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**universal_login_experience:** `Auth0::Types::UniversalLoginExperienceEnum` 
    
</dd>
</dl>

<dl>
<dd>

**identifier_first:** `Internal::Types::Boolean` — Whether identifier first is enabled or not
    
</dd>
</dl>

<dl>
<dd>

**webauthn_platform_first_factor:** `Internal::Types::Boolean` — Use WebAuthn with Device Biometrics as the first authentication factor
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## RefreshTokens
<details><summary><code>client.refresh_tokens.<a href="/lib/auth0/refresh_tokens/client.rb">list</a>() -> Auth0::Types::GetRefreshTokensPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a paginated list of refresh tokens for a specific user, with optional filtering by client ID. Results are sorted by credential_id ascending.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.refresh_tokens.list(
  user_id: "user_id",
  client_id: "client_id",
  from: "from",
  take: 1,
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — ID of the user whose refresh tokens to retrieve. Required.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — Filter results by client ID. Only valid when user_id is provided.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — An opaque cursor from which to start the selection (exclusive). Expires after 24 hours. Obtained from the next property of a previous response.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::RefreshTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.refresh_tokens.<a href="/lib/auth0/refresh_tokens/client.rb">get</a>(id) -> Auth0::Types::GetRefreshTokenResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve refresh token information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.refresh_tokens.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID refresh token to retrieve
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::RefreshTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.refresh_tokens.<a href="/lib/auth0/refresh_tokens/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a refresh token by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.refresh_tokens.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the refresh token to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::RefreshTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.refresh_tokens.<a href="/lib/auth0/refresh_tokens/client.rb">update</a>(id, request) -> Auth0::Types::UpdateRefreshTokenResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a refresh token by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.refresh_tokens.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the refresh token to update.
    
</dd>
</dl>

<dl>
<dd>

**refresh_token_metadata:** `Internal::Types::Hash[String, Object]` — Metadata associated with the refresh token. Pass null or {} to remove all metadata.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::RefreshTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ResourceServers
<details><summary><code>client.resource_servers.<a href="/lib/auth0/resource_servers/client.rb">list</a>() -> Auth0::Types::ListResourceServerOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of all APIs associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.resource_servers.list(
  page: 1,
  per_page: 1,
  include_totals: true,
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**identifiers:** `String` — An optional filter on the resource server identifier. Must be URL encoded and may be specified multiple times (max 10).<br /><b>e.g.</b> <i>../resource-servers?identifiers=id1&identifiers=id2</i>
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ResourceServers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resource_servers.<a href="/lib/auth0/resource_servers/client.rb">create</a>(request) -> Auth0::Types::CreateResourceServerResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new API associated with your tenant. Note that all new APIs must be registered with Auth0. For more information, read <a href="https://www.auth0.com/docs/get-started/apis"> APIs</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.resource_servers.create(identifier: "identifier")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Friendly name for this resource server. Can not contain `<` or `>` characters.
    
</dd>
</dl>

<dl>
<dd>

**identifier:** `String` — Unique identifier for the API used as the audience parameter on authorization calls. Can not be changed once set.
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `Internal::Types::Array[Auth0::Types::ResourceServerScope]` — List of permissions (scopes) that this API uses.
    
</dd>
</dl>

<dl>
<dd>

**signing_alg:** `Auth0::Types::SigningAlgorithmEnum` 
    
</dd>
</dl>

<dl>
<dd>

**signing_secret:** `String` — Secret used to sign tokens when using symmetric algorithms (HS256).
    
</dd>
</dl>

<dl>
<dd>

**allow_offline_access:** `Internal::Types::Boolean` — Whether refresh tokens can be issued for this API (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**allow_online_access:** `Internal::Types::Boolean` — Whether Online Refresh Tokens can be issued for this API (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**token_lifetime:** `Integer` — Expiration value (in seconds) for access tokens issued for this API from the token endpoint.
    
</dd>
</dl>

<dl>
<dd>

**token_dialect:** `Auth0::Types::ResourceServerTokenDialectSchemaEnum` 
    
</dd>
</dl>

<dl>
<dd>

**skip_consent_for_verifiable_first_party_clients:** `Internal::Types::Boolean` — Whether to skip user consent for applications flagged as first party (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**enforce_policies:** `Internal::Types::Boolean` — Whether to enforce authorization policies (true) or to ignore them (false).
    
</dd>
</dl>

<dl>
<dd>

**token_encryption:** `Auth0::Types::ResourceServerTokenEncryption` 
    
</dd>
</dl>

<dl>
<dd>

**consent_policy:** `Auth0::Types::ResourceServerConsentPolicyEnum` 
    
</dd>
</dl>

<dl>
<dd>

**authorization_details:** `Internal::Types::Array[Object]` 
    
</dd>
</dl>

<dl>
<dd>

**proof_of_possession:** `Auth0::Types::ResourceServerProofOfPossession` 
    
</dd>
</dl>

<dl>
<dd>

**subject_type_authorization:** `Auth0::Types::ResourceServerSubjectTypeAuthorization` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ResourceServers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resource_servers.<a href="/lib/auth0/resource_servers/client.rb">get</a>(id) -> Auth0::Types::GetResourceServerResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve <a href="https://auth0.com/docs/apis">API</a> details with the given ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.resource_servers.get(
  id: "id",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID or audience of the resource server to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ResourceServers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resource_servers.<a href="/lib/auth0/resource_servers/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete an existing API by ID. For more information, read <a href="https://www.auth0.com/docs/get-started/apis/api-settings">API Settings</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.resource_servers.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID or the audience of the resource server to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ResourceServers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resource_servers.<a href="/lib/auth0/resource_servers/client.rb">update</a>(id, request) -> Auth0::Types::UpdateResourceServerResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Change an existing API setting by resource server ID. For more information, read <a href="https://www.auth0.com/docs/get-started/apis/api-settings">API Settings</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.resource_servers.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID or audience of the resource server to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Friendly name for this resource server. Can not contain `<` or `>` characters.
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `Internal::Types::Array[Auth0::Types::ResourceServerScope]` — List of permissions (scopes) that this API uses.
    
</dd>
</dl>

<dl>
<dd>

**signing_alg:** `Auth0::Types::SigningAlgorithmEnum` 
    
</dd>
</dl>

<dl>
<dd>

**signing_secret:** `String` — Secret used to sign tokens when using symmetric algorithms (HS256).
    
</dd>
</dl>

<dl>
<dd>

**skip_consent_for_verifiable_first_party_clients:** `Internal::Types::Boolean` — Whether to skip user consent for applications flagged as first party (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**allow_offline_access:** `Internal::Types::Boolean` — Whether refresh tokens can be issued for this API (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**allow_online_access:** `Internal::Types::Boolean` — Whether Online Refresh Tokens can be issued for this API (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**token_lifetime:** `Integer` — Expiration value (in seconds) for access tokens issued for this API from the token endpoint.
    
</dd>
</dl>

<dl>
<dd>

**token_dialect:** `Auth0::Types::ResourceServerTokenDialectSchemaEnum` 
    
</dd>
</dl>

<dl>
<dd>

**enforce_policies:** `Internal::Types::Boolean` — Whether authorization policies are enforced (true) or not enforced (false).
    
</dd>
</dl>

<dl>
<dd>

**token_encryption:** `Auth0::Types::ResourceServerTokenEncryption` 
    
</dd>
</dl>

<dl>
<dd>

**consent_policy:** `Auth0::Types::ResourceServerConsentPolicyEnum` 
    
</dd>
</dl>

<dl>
<dd>

**authorization_details:** `Internal::Types::Array[Object]` 
    
</dd>
</dl>

<dl>
<dd>

**proof_of_possession:** `Auth0::Types::ResourceServerProofOfPossession` 
    
</dd>
</dl>

<dl>
<dd>

**subject_type_authorization:** `Auth0::Types::ResourceServerSubjectTypeAuthorization` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ResourceServers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Roles
<details><summary><code>client.roles.<a href="/lib/auth0/roles/client.rb">list</a>() -> Auth0::Types::ListRolesOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed list of user roles created in your tenant.

<b>Note</b>: The returned list does not include standard roles available for tenant members, such as Admin or Support Access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.list(
  per_page: 1,
  page: 1,
  include_totals: true,
  name_filter: "name_filter"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**name_filter:** `String` — Optional filter on name (case-insensitive).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.roles.<a href="/lib/auth0/roles/client.rb">create</a>(request) -> Auth0::Types::CreateRoleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a user role for <a href="https://auth0.com/docs/manage-users/access-control/rbac">Role-Based Access Control</a>.

<b>Note</b>: New roles are not associated with any permissions by default. To assign existing permissions to your role, review Associate Permissions with a Role. To create new permissions, review Add API Permissions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.create(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Name of the role.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Description of the role.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.roles.<a href="/lib/auth0/roles/client.rb">get</a>(id) -> Auth0::Types::GetRoleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a specific <a href="https://auth0.com/docs/manage-users/access-control/rbac">user role</a> specified by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the role to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.roles.<a href="/lib/auth0/roles/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a specific <a href="https://auth0.com/docs/manage-users/access-control/rbac">user role</a> from your tenant. Once deleted, it is removed from any user who was previously assigned that role. This action cannot be undone.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the role to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.roles.<a href="/lib/auth0/roles/client.rb">update</a>(id, request) -> Auth0::Types::UpdateRoleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify the details of a specific <a href="https://auth0.com/docs/manage-users/access-control/rbac">user role</a> specified by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the role to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Name of this role.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Description of this role.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Rules
<details><summary><code>client.rules.<a href="/lib/auth0/rules/client.rb">list</a>() -> Auth0::Types::ListRulesOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a filtered list of <a href="https://auth0.com/docs/rules">rules</a>. Accepts a list of fields to include or exclude.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules.list(
  page: 1,
  per_page: 1,
  include_totals: true,
  enabled: true,
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Optional filter on whether a rule is enabled (true) or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rules.<a href="/lib/auth0/rules/client.rb">create</a>(request) -> Auth0::Types::CreateRuleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a <a href="https://auth0.com/docs/rules#create-a-new-rule-using-the-management-api">new rule</a>.

Note: Changing a rule's stage of execution from the default <code>login_success</code> can change the rule's function signature to have user omitted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules.create(
  name: "name",
  script: "script"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Name of this rule.
    
</dd>
</dl>

<dl>
<dd>

**script:** `String` — Code to be executed when this rule runs.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Integer` — Order that this rule should execute in relative to other rules. Lower-valued rules execute first.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether the rule is enabled (true), or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rules.<a href="/lib/auth0/rules/client.rb">get</a>(id) -> Auth0::Types::GetRuleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve <a href="https://auth0.com/docs/rules">rule</a> details. Accepts a list of fields to include or exclude in the result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules.get(
  id: "id",
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the rule to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rules.<a href="/lib/auth0/rules/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a rule.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the rule to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rules.<a href="/lib/auth0/rules/client.rb">update</a>(id, request) -> Auth0::Types::UpdateRuleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an existing rule.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the rule to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**script:** `String` — Code to be executed when this rule runs.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Name of this rule.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Integer` — Order that this rule should execute in relative to other rules. Lower-valued rules execute first.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether the rule is enabled (true), or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## RulesConfigs
<details><summary><code>client.rules_configs.<a href="/lib/auth0/rules_configs/client.rb">list</a>() -> Internal::Types::Array[Auth0::Types::RulesConfig]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve rules config variable keys.

    Note: For security, config variable values cannot be retrieved outside rule execution.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules_configs.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::RulesConfigs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rules_configs.<a href="/lib/auth0/rules_configs/client.rb">set</a>(key, request) -> Auth0::Types::SetRulesConfigResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets a rules config variable.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules_configs.set(
  key: "key",
  value: "value"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the rules config variable to set (max length: 127 characters).
    
</dd>
</dl>

<dl>
<dd>

**value:** `String` — Value for a rules config variable.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::RulesConfigs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rules_configs.<a href="/lib/auth0/rules_configs/client.rb">delete</a>(key) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a rules config variable identified by its key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules_configs.delete(key: "key")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the rules config variable to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::RulesConfigs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SelfServiceProfiles
<details><summary><code>client.self_service_profiles.<a href="/lib/auth0/self_service_profiles/client.rb">list</a>() -> Auth0::Types::ListSelfServiceProfilesPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves self-service profiles.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.list(
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.self_service_profiles.<a href="/lib/auth0/self_service_profiles/client.rb">create</a>(request) -> Auth0::Types::CreateSelfServiceProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a self-service profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.create(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — The name of the self-service Profile.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — The description of the self-service Profile.
    
</dd>
</dl>

<dl>
<dd>

**branding:** `Auth0::Types::SelfServiceProfileBrandingProperties` 
    
</dd>
</dl>

<dl>
<dd>

**allowed_strategies:** `Internal::Types::Array[Auth0::Types::SelfServiceProfileAllowedStrategyEnum]` — List of IdP strategies that will be shown to users during the Self-Service SSO flow. Possible values: [`oidc`, `samlp`, `waad`, `google-apps`, `adfs`, `okta`, `auth0-samlp`, `okta-samlp`, `keycloak-samlp`, `pingfederate`]
    
</dd>
</dl>

<dl>
<dd>

**user_attributes:** `Internal::Types::Array[Auth0::Types::SelfServiceProfileUserAttribute]` — List of attributes to be mapped that will be shown to the user during the SS-SSO flow.
    
</dd>
</dl>

<dl>
<dd>

**user_attribute_profile_id:** `String` — ID of the user-attribute-profile to associate with this self-service profile.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.self_service_profiles.<a href="/lib/auth0/self_service_profiles/client.rb">get</a>(id) -> Auth0::Types::GetSelfServiceProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a self-service profile by Id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the self-service profile to retrieve
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.self_service_profiles.<a href="/lib/auth0/self_service_profiles/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a self-service profile by Id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the self-service profile to delete
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.self_service_profiles.<a href="/lib/auth0/self_service_profiles/client.rb">update</a>(id, request) -> Auth0::Types::UpdateSelfServiceProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a self-service profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the self-service profile to update
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — The name of the self-service Profile.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**branding:** `Auth0::Types::SelfServiceProfileBrandingProperties` 
    
</dd>
</dl>

<dl>
<dd>

**allowed_strategies:** `Internal::Types::Array[Auth0::Types::SelfServiceProfileAllowedStrategyEnum]` — List of IdP strategies that will be shown to users during the Self-Service SSO flow. Possible values: [`oidc`, `samlp`, `waad`, `google-apps`, `adfs`, `okta`, `auth0-samlp`, `okta-samlp`, `keycloak-samlp`, `pingfederate`]
    
</dd>
</dl>

<dl>
<dd>

**user_attributes:** `Internal::Types::Array[Auth0::Types::SelfServiceProfileUserAttribute]` 
    
</dd>
</dl>

<dl>
<dd>

**user_attribute_profile_id:** `String` — ID of the user-attribute-profile to associate with this self-service profile.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Sessions
<details><summary><code>client.sessions.<a href="/lib/auth0/sessions/client.rb">get</a>(id) -> Auth0::Types::GetSessionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve session information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sessions.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of session to retrieve
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Sessions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sessions.<a href="/lib/auth0/sessions/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a session by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sessions.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the session to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Sessions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sessions.<a href="/lib/auth0/sessions/client.rb">update</a>(id, request) -> Auth0::Types::UpdateSessionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update session information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sessions.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the session to update.
    
</dd>
</dl>

<dl>
<dd>

**session_metadata:** `Internal::Types::Hash[String, Object]` — Metadata associated with the session. Pass null or {} to remove all session_metadata.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Sessions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sessions.<a href="/lib/auth0/sessions/client.rb">revoke</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Revokes a session by ID and all associated refresh tokens.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sessions.revoke(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the session to revoke.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Sessions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Stats
<details><summary><code>client.stats.<a href="/lib/auth0/stats/client.rb">get_active_users_count</a>() -> Integer</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the number of active users that logged in during the last 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.stats.get_active_users_count
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Stats::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stats.<a href="/lib/auth0/stats/client.rb">get_daily</a>() -> Internal::Types::Array[Auth0::Types::DailyStats]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the number of logins, signups and breached-password detections (subscription required) that occurred each day within a specified date range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.stats.get_daily(
  from: "from",
  to: "to"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional first day of the date range (inclusive) in YYYYMMDD format.
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — Optional last day of the date range (inclusive) in YYYYMMDD format.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Stats::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SupplementalSignals
<details><summary><code>client.supplemental_signals.<a href="/lib/auth0/supplemental_signals/client.rb">get</a>() -> Auth0::Types::GetSupplementalSignalsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the supplemental signals configuration for a tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.supplemental_signals.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::SupplementalSignals::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.supplemental_signals.<a href="/lib/auth0/supplemental_signals/client.rb">patch</a>(request) -> Auth0::Types::PatchSupplementalSignalsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the supplemental signals configuration for a tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.supplemental_signals.patch(akamai_enabled: true)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**akamai_enabled:** `Internal::Types::Boolean` — Indicates if incoming Akamai Headers should be processed
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SupplementalSignals::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tickets
<details><summary><code>client.tickets.<a href="/lib/auth0/tickets/client.rb">verify_email</a>(request) -> Auth0::Types::VerifyEmailTicketResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an email verification ticket for a given user. An email verification ticket is a generated URL that the user can consume to verify their email address.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tickets.verify_email(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**result_url:** `String` — URL the user will be redirected to in the classic Universal Login experience once the ticket is used. Cannot be specified when using client_id or organization_id.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — user_id of for whom the ticket should be created.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — ID of the client (application). If provided for tenants using the New Universal Login experience, the email template and UI displays application details, and the user is prompted to redirect to the application's <a target='' href='https://auth0.com/docs/authenticate/login/auth0-universal-login/configure-default-login-routes#completing-the-password-reset-flow'>default login route</a> after the ticket is used. client_id is required to use the <a target='' href='https://auth0.com/docs/customize/actions/flows-and-triggers/post-change-password-flow'>Password Reset Post Challenge</a> trigger.
    
</dd>
</dl>

<dl>
<dd>

**organization_id:** `String` — (Optional) Organization ID – the ID of the Organization. If provided, organization parameters will be made available to the email template and organization branding will be applied to the prompt. In addition, the redirect link in the prompt will include organization_id and organization_name query string parameters.
    
</dd>
</dl>

<dl>
<dd>

**ttl_sec:** `Integer` — Number of seconds for which the ticket is valid before expiration. If unspecified or set to 0, this value defaults to 432000 seconds (5 days).
    
</dd>
</dl>

<dl>
<dd>

**include_email_in_redirect:** `Internal::Types::Boolean` — Whether to include the email address as part of the returnUrl in the reset_email (true), or not (false).
    
</dd>
</dl>

<dl>
<dd>

**identity:** `Auth0::Types::Identity` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Tickets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tickets.<a href="/lib/auth0/tickets/client.rb">change_password</a>(request) -> Auth0::Types::ChangePasswordTicketResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a password change ticket for a given user. A password change ticket is a generated URL that the user can consume to start a reset password flow.

Note: This endpoint does not verify the given user’s identity. If you call this endpoint within your application, you must design your application to verify the user’s identity.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tickets.change_password
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**result_url:** `String` — URL the user will be redirected to in the classic Universal Login experience once the ticket is used. Cannot be specified when using client_id or organization_id.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — user_id of for whom the ticket should be created.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — ID of the client (application). If provided for tenants using the New Universal Login experience, the email template and UI displays application details, and the user is prompted to redirect to the application's <a target='' href='https://auth0.com/docs/authenticate/login/auth0-universal-login/configure-default-login-routes#completing-the-password-reset-flow'>default login route</a> after the ticket is used. client_id is required to use the <a target='' href='https://auth0.com/docs/customize/actions/flows-and-triggers/post-change-password-flow'>Password Reset Post Challenge</a> trigger.
    
</dd>
</dl>

<dl>
<dd>

**organization_id:** `String` — (Optional) Organization ID – the ID of the Organization. If provided, organization parameters will be made available to the email template and organization branding will be applied to the prompt. In addition, the redirect link in the prompt will include organization_id and organization_name query string parameters.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — ID of the connection. If provided, allows the user to be specified using email instead of user_id. If you set this value, you must also send the email parameter. You cannot send user_id when specifying a connection_id.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — Email address of the user for whom the tickets should be created. Requires the connection_id parameter. Cannot be specified when using user_id.
    
</dd>
</dl>

<dl>
<dd>

**ttl_sec:** `Integer` — Number of seconds for which the ticket is valid before expiration. If unspecified or set to 0, this value defaults to 432000 seconds (5 days).
    
</dd>
</dl>

<dl>
<dd>

**mark_email_as_verified:** `Internal::Types::Boolean` — Whether to set the email_verified attribute to true (true) or whether it should not be updated (false).
    
</dd>
</dl>

<dl>
<dd>

**include_email_in_redirect:** `Internal::Types::Boolean` — Whether to include the email address as part of the returnUrl in the reset_email (true), or not (false).
    
</dd>
</dl>

<dl>
<dd>

**identity:** `Auth0::Types::ChangePasswordTicketIdentity` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Tickets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TokenExchangeProfiles
<details><summary><code>client.token_exchange_profiles.<a href="/lib/auth0/token_exchange_profiles/client.rb">list</a>() -> Auth0::Types::ListTokenExchangeProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of all Token Exchange Profiles available in your tenant.

By using this feature, you agree to the applicable Free Trial terms in <a href="https://www.okta.com/legal/">Okta’s Master Subscription Agreement</a>. It is your responsibility to securely validate the user’s subject_token. See <a href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.

This endpoint supports Checkpoint pagination. To search by checkpoint, use the following parameters:
<ul>
<li><code>from</code>: Optional id from which to start selection.</li>
<li><code>take</code>: The total amount of entries to retrieve when using the from parameter. Defaults to 50.</li>
</ul>

<b>Note</b>: The first time you call this endpoint using checkpoint pagination, omit the <code>from</code> parameter. If there are more results, a <code>next</code> value is included in the response. You can use this for subsequent API calls. When <code>next</code> is no longer included in the response, no pages are remaining.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.token_exchange_profiles.list(
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::TokenExchangeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.token_exchange_profiles.<a href="/lib/auth0/token_exchange_profiles/client.rb">create</a>(request) -> Auth0::Types::CreateTokenExchangeProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new Token Exchange Profile within your tenant.

By using this feature, you agree to the applicable Free Trial terms in <a href="https://www.okta.com/legal/">Okta’s Master Subscription Agreement</a>. It is your responsibility to securely validate the user’s subject_token. See <a href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.token_exchange_profiles.create(
  name: "name",
  subject_token_type: "subject_token_type",
  action_id: "action_id",
  type: "custom_authentication"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Friendly name of this profile.
    
</dd>
</dl>

<dl>
<dd>

**subject_token_type:** `String` — Subject token type for this profile. When receiving a token exchange request on the Authentication API, the corresponding token exchange profile with a matching subject_token_type will be executed. This must be a URI.
    
</dd>
</dl>

<dl>
<dd>

**action_id:** `String` — The ID of the Custom Token Exchange action to execute for this profile, in order to validate the subject_token. The action must use the custom-token-exchange trigger.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Auth0::Types::TokenExchangeProfileTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::TokenExchangeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.token_exchange_profiles.<a href="/lib/auth0/token_exchange_profiles/client.rb">get</a>(id) -> Auth0::Types::GetTokenExchangeProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a single Token Exchange Profile specified by ID.

By using this feature, you agree to the applicable Free Trial terms in <a href="https://www.okta.com/legal/">Okta’s Master Subscription Agreement</a>. It is your responsibility to securely validate the user’s subject_token. See <a href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.token_exchange_profiles.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the Token Exchange Profile to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::TokenExchangeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.token_exchange_profiles.<a href="/lib/auth0/token_exchange_profiles/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a Token Exchange Profile within your tenant.

By using this feature, you agree to the applicable Free Trial terms in <a href="https://www.okta.com/legal/">Okta's Master Subscription Agreement</a>. It is your responsibility to securely validate the user's subject_token. See <a href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.

</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.token_exchange_profiles.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the Token Exchange Profile to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::TokenExchangeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.token_exchange_profiles.<a href="/lib/auth0/token_exchange_profiles/client.rb">update</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a Token Exchange Profile within your tenant.

By using this feature, you agree to the applicable Free Trial terms in <a href="https://www.okta.com/legal/">Okta's Master Subscription Agreement</a>. It is your responsibility to securely validate the user's subject_token. See <a href="https://auth0.com/docs/authenticate/custom-token-exchange">User Guide</a> for more details.

</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.token_exchange_profiles.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the Token Exchange Profile to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Friendly name of this profile.
    
</dd>
</dl>

<dl>
<dd>

**subject_token_type:** `String` — Subject token type for this profile. When receiving a token exchange request on the Authentication API, the corresponding token exchange profile with a matching subject_token_type will be executed. This must be a URI.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::TokenExchangeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## UserAttributeProfiles
<details><summary><code>client.user_attribute_profiles.<a href="/lib/auth0/user_attribute_profiles/client.rb">list</a>() -> Auth0::Types::ListUserAttributeProfilesPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of User Attribute Profiles. This endpoint supports Checkpoint pagination.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_attribute_profiles.list(
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 5.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserAttributeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_attribute_profiles.<a href="/lib/auth0/user_attribute_profiles/client.rb">create</a>(request) -> Auth0::Types::CreateUserAttributeProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a single User Attribute Profile specified by ID. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_attribute_profiles.create(
  name: "name",
  user_attributes: {
    key: {
      description: "description",
      label: "label",
      profile_required: true,
      auth0mapping: "auth0_mapping"
    }
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `Auth0::Types::UserAttributeProfileUserID` 
    
</dd>
</dl>

<dl>
<dd>

**user_attributes:** `Internal::Types::Hash[String, Auth0::Types::UserAttributeProfileUserAttributeAdditionalProperties]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserAttributeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_attribute_profiles.<a href="/lib/auth0/user_attribute_profiles/client.rb">list_templates</a>() -> Auth0::Types::ListUserAttributeProfileTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of User Attribute Profile Templates.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_attribute_profiles.list_templates
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::UserAttributeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_attribute_profiles.<a href="/lib/auth0/user_attribute_profiles/client.rb">get_template</a>(id) -> Auth0::Types::GetUserAttributeProfileTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a User Attribute Profile Template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_attribute_profiles.get_template(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user-attribute-profile-template to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserAttributeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_attribute_profiles.<a href="/lib/auth0/user_attribute_profiles/client.rb">get</a>(id) -> Auth0::Types::GetUserAttributeProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a single User Attribute Profile specified by ID. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_attribute_profiles.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user-attribute-profile to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserAttributeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_attribute_profiles.<a href="/lib/auth0/user_attribute_profiles/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a single User Attribute Profile specified by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_attribute_profiles.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user-attribute-profile to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserAttributeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_attribute_profiles.<a href="/lib/auth0/user_attribute_profiles/client.rb">update</a>(id, request) -> Auth0::Types::UpdateUserAttributeProfileResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the details of a specific User attribute profile, such as name, user_id and user_attributes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_attribute_profiles.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user attribute profile to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `Auth0::Types::UserAttributeProfileUserID` 
    
</dd>
</dl>

<dl>
<dd>

**user_attributes:** `Internal::Types::Hash[String, Auth0::Types::UserAttributeProfileUserAttributeAdditionalProperties]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserAttributeProfiles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## UserBlocks
<details><summary><code>client.user_blocks.<a href="/lib/auth0/user_blocks/client.rb">list_by_identifier</a>() -> Auth0::Types::ListUserBlocksByIdentifierResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of all <a href="https://auth0.com/docs/secure/attack-protection/brute-force-protection">Brute-force Protection</a> blocks for a user with the given identifier (username, phone number, or email).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_blocks.list_by_identifier(
  identifier: "identifier",
  consider_brute_force_enablement: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**identifier:** `String` — Should be any of a username, phone number, or email.
    
</dd>
</dl>

<dl>
<dd>

**consider_brute_force_enablement:** `Internal::Types::Boolean` 


          If true and Brute Force Protection is enabled and configured to block logins, will return a list of blocked IP addresses.
          If true and Brute Force Protection is disabled, will return an empty list.
        
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserBlocks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_blocks.<a href="/lib/auth0/user_blocks/client.rb">delete_by_identifier</a>() -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove all <a href="https://auth0.com/docs/secure/attack-protection/brute-force-protection">Brute-force Protection</a> blocks for the user with the given identifier (username, phone number, or email).

Note: This endpoint does not unblock users that were <a href="https://auth0.com/docs/user-profile#block-and-unblock-a-user">blocked by a tenant administrator</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_blocks.delete_by_identifier(identifier: "identifier")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**identifier:** `String` — Should be any of a username, phone number, or email.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserBlocks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_blocks.<a href="/lib/auth0/user_blocks/client.rb">list</a>(id) -> Auth0::Types::ListUserBlocksResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of all <a href="https://auth0.com/docs/secure/attack-protection/brute-force-protection">Brute-force Protection</a> blocks for the user with the given ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_blocks.list(
  id: "id",
  consider_brute_force_enablement: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — user_id of the user blocks to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**consider_brute_force_enablement:** `Internal::Types::Boolean` 


          If true and Brute Force Protection is enabled and configured to block logins, will return a list of blocked IP addresses.
          If true and Brute Force Protection is disabled, will return an empty list.
        
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserBlocks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user_blocks.<a href="/lib/auth0/user_blocks/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove all <a href="https://auth0.com/docs/secure/attack-protection/brute-force-protection">Brute-force Protection</a> blocks for the user with the given ID.

Note: This endpoint does not unblock users that were <a href="https://auth0.com/docs/user-profile#block-and-unblock-a-user">blocked by a tenant administrator</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user_blocks.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user_id of the user to update.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::UserBlocks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users
<details><summary><code>client.users.<a href="/lib/auth0/users/client.rb">list</a>() -> Auth0::Types::ListUsersOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of users. It is possible to:

- Specify a search criteria for users
- Sort the users to be returned
- Select the fields to be returned
- Specify the number of users to retrieve per page and the page index
 <!-- only v3 is available -->
The <code>q</code> query parameter can be used to get users that match the specified criteria <a href="https://auth0.com/docs/users/search/v3/query-syntax">using query string syntax.</a>

<a href="https://auth0.com/docs/users/search/v3">Learn more about searching for users.</a>

Read about <a href="https://auth0.com/docs/users/search/best-practices">best practices</a> when working with the API endpoints for retrieving users.

Auth0 limits the number of users you can return. If you exceed this threshold, please redefine your search, use the <a href="https://auth0.com/docs/api/management/v2#!/Jobs/post_users_exports">export job</a>, or the <a href="https://auth0.com/docs/extensions/user-import-export">User Import / Export</a> extension.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.list(
  page: 1,
  per_page: 1,
  include_totals: true,
  sort: "sort",
  connection: "connection",
  fields: "fields",
  include_fields: true,
  q: "q",
  search_engine: "v1",
  primary_order: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**sort:** `String` — Field to sort by. Use <code>field:order</code> where order is <code>1</code> for ascending and <code>-1</code> for descending. e.g. <code>created_at:1</code>
    
</dd>
</dl>

<dl>
<dd>

**connection:** `String` — Connection filter. Only applies when using <code>search_engine=v1</code>. To filter by connection with <code>search_engine=v2|v3</code>, use <code>q=identities.connection:"connection_name"</code>
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**q:** `String` — Query in <a target='_new' href ='https://lucene.apache.org/core/2_9_4/queryparsersyntax.html'>Lucene query string syntax</a>. Some query types cannot be used on metadata fields, for details see <a href='https://auth0.com/docs/users/search/v3/query-syntax#searchable-fields'>Searchable Fields</a>.
    
</dd>
</dl>

<dl>
<dd>

**search_engine:** `Auth0::Types::SearchEngineVersionsEnum` — The version of the search engine
    
</dd>
</dl>

<dl>
<dd>

**primary_order:** `Internal::Types::Boolean` — If true (default), results are returned in a deterministic order. If false, results may be returned in a non-deterministic order, which can enhance performance for complex queries targeting a small number of users. Set to false only when consistent ordering and pagination is not required.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/auth0/users/client.rb">create</a>(request) -> Auth0::Types::CreateUserResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new user for a given <a href="https://auth0.com/docs/connections/database">database</a> or <a href="https://auth0.com/docs/connections/passwordless">passwordless</a> connection.

Note: <code>connection</code> is required but other parameters such as <code>email</code> and <code>password</code> are dependent upon the type of connection.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.create(connection: "connection")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**email:** `String` — The user's email.
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — The user's phone number (following the E.164 recommendation).
    
</dd>
</dl>

<dl>
<dd>

**user_metadata:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**blocked:** `Internal::Types::Boolean` — Whether this user was blocked by an administrator (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**email_verified:** `Internal::Types::Boolean` — Whether this email address is verified (true) or unverified (false). User will receive a verification email after creation if `email_verified` is false or not specified
    
</dd>
</dl>

<dl>
<dd>

**phone_verified:** `Internal::Types::Boolean` — Whether this phone number has been verified (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**app_metadata:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**given_name:** `String` — The user's given name(s).
    
</dd>
</dl>

<dl>
<dd>

**family_name:** `String` — The user's family name(s).
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — The user's full name.
    
</dd>
</dl>

<dl>
<dd>

**nickname:** `String` — The user's nickname.
    
</dd>
</dl>

<dl>
<dd>

**picture:** `String` — A URI pointing to the user's picture.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — The external user's id provided by the identity provider.
    
</dd>
</dl>

<dl>
<dd>

**connection:** `String` — Name of the connection this user should be created in.
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` — Initial password for this user. Only valid for auth0 connection strategy.
    
</dd>
</dl>

<dl>
<dd>

**verify_email:** `Internal::Types::Boolean` — Whether the user will receive a verification email after creation (true) or no email (false). Overrides behavior of `email_verified` parameter.
    
</dd>
</dl>

<dl>
<dd>

**username:** `String` — The user's username. Only valid if the connection requires a username.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/auth0/users/client.rb">list_users_by_email</a>() -> Internal::Types::Array[Auth0::Types::UserResponseSchema]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Find users by email. If Auth0 is the identity provider (idP), the email address associated with a user is saved in lower case, regardless of how you initially provided it. 

For example, if you register a user as JohnSmith@example.com, Auth0 saves the user's email as johnsmith@example.com. 

Therefore, when using this endpoint, make sure that you are searching for users via email addresses using the correct case.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.list_users_by_email(
  fields: "fields",
  include_fields: true,
  email: "email"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false). Defaults to true.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — Email address to search for (case-sensitive).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/auth0/users/client.rb">get</a>(id) -> Auth0::Types::GetUserResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve user details. A list of fields to include or exclude may also be specified. For more information, see <a href="https://auth0.com/docs/manage-users/user-search/retrieve-users-with-get-users-endpoint">Retrieve Users with the Get Users Endpoint</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.get(
  id: "id",
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/auth0/users/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a user by user ID. This action cannot be undone. For Auth0 Dashboard instructions, see <a href="https://auth0.com/docs/manage-users/user-accounts/delete-users">Delete Users</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/auth0/users/client.rb">update</a>(id, request) -> Auth0::Types::UpdateUserResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a user.

These are the attributes that can be updated at the root level:

<ul>
    <li>app_metadata</li>
    <li>blocked</li>
    <li>email</li>
    <li>email_verified</li>
    <li>family_name</li>
    <li>given_name</li>
    <li>name</li>
    <li>nickname</li>
    <li>password</li>
    <li>phone_number</li>
    <li>phone_verified</li>
    <li>picture</li>
    <li>username</li>
    <li>user_metadata</li>
    <li>verify_email</li>
</ul>

Some considerations:
<ul>
    <li>The properties of the new object will replace the old ones.</li>
    <li>The metadata fields are an exception to this rule (<code>user_metadata</code> and <code>app_metadata</code>). These properties are merged instead of being replaced but be careful, the merge only occurs on the first level.</li>
    <li>If you are updating <code>email</code>, <code>email_verified</code>, <code>phone_number</code>, <code>phone_verified</code>, <code>username</code> or <code>password</code> of a secondary identity, you need to specify the <code>connection</code> property too.</li>
    <li>If you are updating <code>email</code> or <code>phone_number</code> you can specify, optionally, the <code>client_id</code> property.</li>
    <li>Updating <code>email_verified</code> is not supported for enterprise and passwordless sms connections.</li>
    <li>Updating the <code>blocked</code> to <code>false</code> does not affect the user's blocked state from an excessive amount of incorrectly provided credentials. Use the "Unblock a user" endpoint from the "User Blocks" API to change the user's state.</li>
    <li>Supported attributes can be unset by supplying <code>null</code> as the value.</li>
</ul>

<h5>Updating a field (non-metadata property)</h5>
To mark the email address of a user as verified, the body to send should be:
<pre><code>{ "email_verified": true }</code></pre>

<h5>Updating a user metadata root property</h5>Let's assume that our test user has the following <code>user_metadata</code>:
<pre><code>{ "user_metadata" : { "profileCode": 1479 } }</code></pre>

To add the field <code>addresses</code> the body to send should be:
<pre><code>{ "user_metadata" : { "addresses": {"work_address": "100 Industrial Way"} }}</code></pre>

The modified object ends up with the following <code>user_metadata</code> property:<pre><code>{
  "user_metadata": {
    "profileCode": 1479,
    "addresses": { "work_address": "100 Industrial Way" }
  }
}</code></pre>

<h5>Updating an inner user metadata property</h5>If there's existing user metadata to which we want to add  <code>"home_address": "742 Evergreen Terrace"</code> (using the <code>addresses</code> property) we should send the whole <code>addresses</code> object. Since this is a first-level object, the object will be merged in, but its own properties will not be. The body to send should be:
<pre><code>{
  "user_metadata": {
    "addresses": {
      "work_address": "100 Industrial Way",
      "home_address": "742 Evergreen Terrace"
    }
  }
}</code></pre>

The modified object ends up with the following <code>user_metadata</code> property:
<pre><code>{
  "user_metadata": {
    "profileCode": 1479,
    "addresses": {
      "work_address": "100 Industrial Way",
      "home_address": "742 Evergreen Terrace"
    }
  }
}</code></pre>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to update.
    
</dd>
</dl>

<dl>
<dd>

**blocked:** `Internal::Types::Boolean` — Whether this user was blocked by an administrator (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**email_verified:** `Internal::Types::Boolean` — Whether this email address is verified (true) or unverified (false). If set to false the user will not receive a verification email unless `verify_email` is set to true.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — Email address of this user.
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — The user's phone number (following the E.164 recommendation).
    
</dd>
</dl>

<dl>
<dd>

**phone_verified:** `Internal::Types::Boolean` — Whether this phone number has been verified (true) or not (false).
    
</dd>
</dl>

<dl>
<dd>

**user_metadata:** `Internal::Types::Hash[String, Object]` — User metadata to which this user has read/write access.
    
</dd>
</dl>

<dl>
<dd>

**app_metadata:** `Internal::Types::Hash[String, Object]` — User metadata to which this user has read-only access.
    
</dd>
</dl>

<dl>
<dd>

**given_name:** `String` — Given name/first name/forename of this user.
    
</dd>
</dl>

<dl>
<dd>

**family_name:** `String` — Family name/last name/surname of this user.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Name of this user.
    
</dd>
</dl>

<dl>
<dd>

**nickname:** `String` — Preferred nickname or alias of this user.
    
</dd>
</dl>

<dl>
<dd>

**picture:** `String` — URL to picture, photo, or avatar of this user.
    
</dd>
</dl>

<dl>
<dd>

**verify_email:** `Internal::Types::Boolean` — Whether this user will receive a verification email after creation (true) or no email (false). Overrides behavior of `email_verified` parameter.
    
</dd>
</dl>

<dl>
<dd>

**verify_phone_number:** `Internal::Types::Boolean` — Whether this user will receive a text after changing the phone number (true) or no text (false). Only valid when changing phone number for SMS connections.
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` — New password for this user. Only valid for database connections.
    
</dd>
</dl>

<dl>
<dd>

**connection:** `String` — Name of the connection to target for this user update.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — Auth0 client ID. Only valid when updating email address.
    
</dd>
</dl>

<dl>
<dd>

**username:** `String` — The user's username. Only valid if the connection requires a username.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/auth0/users/client.rb">regenerate_recovery_code</a>(id) -> Auth0::Types::RegenerateUsersRecoveryCodeResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove an existing multi-factor authentication (MFA) <a href="https://auth0.com/docs/secure/multi-factor-authentication/reset-user-mfa">recovery code</a> and generate a new one. If a user cannot access the original device or account used for MFA enrollment, they can use a recovery code to authenticate. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.regenerate_recovery_code(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to regenerate a multi-factor authentication recovery code for.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/auth0/users/client.rb">revoke_access</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Revokes selected resources related to a user (sessions, refresh tokens, ...).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.revoke_access(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**session_id:** `String` — ID of the session to revoke.
    
</dd>
</dl>

<dl>
<dd>

**preserve_refresh_tokens:** `Internal::Types::Boolean` — Whether to preserve the refresh tokens associated with the session.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Actions Versions
<details><summary><code>client.actions.versions.<a href="/lib/auth0/actions/versions/client.rb">list</a>(action_id) -> Auth0::Types::ListActionVersionsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all of an action's versions. An action version is created whenever an action is deployed. An action version is immutable, once created.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.versions.list(
  action_id: "actionId",
  page: 1,
  per_page: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**action_id:** `String` — The ID of the action.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Use this field to request a specific page of the list results.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — This field specify the maximum number of results to be returned by the server. 20 by default
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Versions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.versions.<a href="/lib/auth0/actions/versions/client.rb">get</a>(action_id, id) -> Auth0::Types::GetActionVersionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a specific version of an action. An action version is created whenever an action is deployed. An action version is immutable, once created.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.versions.get(
  action_id: "actionId",
  id: "id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**action_id:** `String` — The ID of the action.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The ID of the action version.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Versions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.versions.<a href="/lib/auth0/actions/versions/client.rb">deploy</a>(action_id, id, request) -> Auth0::Types::DeployActionVersionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Performs the equivalent of a roll-back of an action to an earlier, specified version. Creates a new, deployed action version that is identical to the specified version. If this action is currently bound to a trigger, the system will begin executing the newly-created version immediately.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.versions.deploy(
  action_id: "actionId",
  id: "id",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**action_id:** `String` — The ID of an action.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The ID of an action version.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Auth0::Types::DeployActionVersionRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Versions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Actions Executions
<details><summary><code>client.actions.executions.<a href="/lib/auth0/actions/executions/client.rb">get</a>(id) -> Auth0::Types::GetActionExecutionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve information about a specific execution of a trigger. Relevant execution IDs will be included in tenant logs generated as part of that authentication flow. Executions will only be stored for 10 days after their creation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.executions.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the execution to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Executions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Actions Modules
<details><summary><code>client.actions.modules.<a href="/lib/auth0/actions/modules/client.rb">list</a>() -> Auth0::Types::GetActionModulesResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a paginated list of all Actions Modules with optional filtering and totals.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.list(
  page: 1,
  per_page: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Paging is disabled if parameter not sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.modules.<a href="/lib/auth0/actions/modules/client.rb">create</a>(request) -> Auth0::Types::CreateActionModuleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new Actions Module for reusable code across actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.create(
  name: "name",
  code: "code"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — The name of the action module.
    
</dd>
</dl>

<dl>
<dd>

**code:** `String` — The source code of the action module.
    
</dd>
</dl>

<dl>
<dd>

**secrets:** `Internal::Types::Array[Auth0::Types::ActionModuleSecretRequest]` — The secrets to associate with the action module.
    
</dd>
</dl>

<dl>
<dd>

**dependencies:** `Internal::Types::Array[Auth0::Types::ActionModuleDependencyRequest]` — The npm dependencies of the action module.
    
</dd>
</dl>

<dl>
<dd>

**api_version:** `String` — The API version of the module.
    
</dd>
</dl>

<dl>
<dd>

**publish:** `Internal::Types::Boolean` — Whether to publish the module immediately after creation.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.modules.<a href="/lib/auth0/actions/modules/client.rb">get</a>(id) -> Auth0::Types::GetActionModuleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of a specific Actions Module by its unique identifier.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the action module to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.modules.<a href="/lib/auth0/actions/modules/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete an Actions Module. This will fail if the module is still in use by any actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the Actions Module to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.modules.<a href="/lib/auth0/actions/modules/client.rb">update</a>(id, request) -> Auth0::Types::UpdateActionModuleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update properties of an existing Actions Module, such as code, dependencies, or secrets.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the action module to update.
    
</dd>
</dl>

<dl>
<dd>

**code:** `String` — The source code of the action module.
    
</dd>
</dl>

<dl>
<dd>

**secrets:** `Internal::Types::Array[Auth0::Types::ActionModuleSecretRequest]` — The secrets to associate with the action module.
    
</dd>
</dl>

<dl>
<dd>

**dependencies:** `Internal::Types::Array[Auth0::Types::ActionModuleDependencyRequest]` — The npm dependencies of the action module.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.modules.<a href="/lib/auth0/actions/modules/client.rb">list_actions</a>(id) -> Auth0::Types::GetActionModuleActionsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists all actions that are using a specific Actions Module, showing which deployed action versions reference this Actions Module.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.list_actions(
  id: "id",
  page: 1,
  per_page: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique ID of the module.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.modules.<a href="/lib/auth0/actions/modules/client.rb">rollback</a>(id, request) -> Auth0::Types::RollbackActionModuleResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Rolls back an Actions Module's draft to a previously created version. This action copies the code, dependencies, and secrets from the specified version into the current draft.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.rollback(
  id: "id",
  module_version_id: "module_version_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique ID of the module to roll back.
    
</dd>
</dl>

<dl>
<dd>

**module_version_id:** `String` — The unique ID of the module version to roll back to.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Actions Triggers
<details><summary><code>client.actions.triggers.<a href="/lib/auth0/actions/triggers/client.rb">list</a>() -> Auth0::Types::ListActionTriggersResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the set of triggers currently available within actions. A trigger is an extensibility point to which actions can be bound.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.triggers.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Actions::Triggers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Actions Modules Versions
<details><summary><code>client.actions.modules.versions.<a href="/lib/auth0/actions/modules/versions/client.rb">list</a>(id) -> Auth0::Types::GetActionModuleVersionsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all published versions of a specific Actions Module.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.versions.list(
  id: "id",
  page: 1,
  per_page: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique ID of the module.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Use this field to request a specific page of the list results.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — The maximum number of results to be returned by the server in a single response. 20 by default.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::Versions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.modules.versions.<a href="/lib/auth0/actions/modules/versions/client.rb">create</a>(id) -> Auth0::Types::CreateActionModuleVersionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new immutable version of an Actions Module from the current draft version. This publishes the draft as a new version that can be referenced by actions, while maintaining the existing draft for continued development.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.versions.create(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the action module to create a version for.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::Versions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.modules.versions.<a href="/lib/auth0/actions/modules/versions/client.rb">get</a>(id, version_id) -> Auth0::Types::GetActionModuleVersionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the details of a specific, immutable version of an Actions Module.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.modules.versions.get(
  id: "id",
  version_id: "versionId"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique ID of the module.
    
</dd>
</dl>

<dl>
<dd>

**version_id:** `String` — The unique ID of the module version to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Modules::Versions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Actions Triggers Bindings
<details><summary><code>client.actions.triggers.bindings.<a href="/lib/auth0/actions/triggers/bindings/client.rb">list</a>(trigger_id) -> Auth0::Types::ListActionBindingsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the actions that are bound to a trigger. Once an action is created and deployed, it must be attached (i.e. bound) to a trigger so that it will be executed as part of a flow. The list of actions returned reflects the order in which they will be executed during the appropriate flow.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.triggers.bindings.list(
  trigger_id: "post-login",
  page: 1,
  per_page: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**trigger_id:** `Auth0::Types::ActionTriggerTypeEnum` — An actions extensibility point.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Use this field to request a specific page of the list results.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — The maximum number of results to be returned in a single request. 20 by default
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Triggers::Bindings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.actions.triggers.bindings.<a href="/lib/auth0/actions/triggers/bindings/client.rb">update_many</a>(trigger_id, request) -> Auth0::Types::UpdateActionBindingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the actions that are bound (i.e. attached) to a trigger. Once an action is created and deployed, it must be attached (i.e. bound) to a trigger so that it will be executed as part of a flow. The order in which the actions are provided will determine the order in which they are executed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.actions.triggers.bindings.update_many(trigger_id: "post-login")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**trigger_id:** `Auth0::Types::ActionTriggerTypeEnum` — An actions extensibility point.
    
</dd>
</dl>

<dl>
<dd>

**bindings:** `Internal::Types::Array[Auth0::Types::ActionBindingWithRef]` — The actions that will be bound to this trigger. The order in which they are included will be the order in which they are executed.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Actions::Triggers::Bindings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Anomaly Blocks
<details><summary><code>client.anomaly.blocks.<a href="/lib/auth0/anomaly/blocks/client.rb">check_ip</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Check if the given IP address is blocked via the <a href="https://auth0.com/docs/configure/attack-protection/suspicious-ip-throttling">Suspicious IP Throttling</a> due to multiple suspicious attempts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.anomaly.blocks.check_ip(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — IP address to check.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Anomaly::Blocks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.anomaly.blocks.<a href="/lib/auth0/anomaly/blocks/client.rb">unblock_ip</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove a block imposed by <a href="https://auth0.com/docs/configure/attack-protection/suspicious-ip-throttling">Suspicious IP Throttling</a> for the given IP address.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.anomaly.blocks.unblock_ip(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — IP address to unblock.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Anomaly::Blocks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AttackProtection BotDetection
<details><summary><code>client.attack_protection.bot_detection.<a href="/lib/auth0/attack_protection/bot_detection/client.rb">get</a>() -> Auth0::Types::GetBotDetectionSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the Bot Detection configuration of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.bot_detection.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::BotDetection::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attack_protection.bot_detection.<a href="/lib/auth0/attack_protection/bot_detection/client.rb">update</a>(request) -> Auth0::Types::UpdateBotDetectionSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the Bot Detection configuration of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.bot_detection.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bot_detection_level:** `Auth0::Types::BotDetectionLevelEnum` 
    
</dd>
</dl>

<dl>
<dd>

**challenge_password_policy:** `Auth0::Types::BotDetectionChallengePolicyPasswordFlowEnum` 
    
</dd>
</dl>

<dl>
<dd>

**challenge_passwordless_policy:** `Auth0::Types::BotDetectionChallengePolicyPasswordlessFlowEnum` 
    
</dd>
</dl>

<dl>
<dd>

**challenge_password_reset_policy:** `Auth0::Types::BotDetectionChallengePolicyPasswordResetFlowEnum` 
    
</dd>
</dl>

<dl>
<dd>

**allowlist:** `Internal::Types::Array[String]` 
    
</dd>
</dl>

<dl>
<dd>

**monitoring_mode_enabled:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::BotDetection::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AttackProtection BreachedPasswordDetection
<details><summary><code>client.attack_protection.breached_password_detection.<a href="/lib/auth0/attack_protection/breached_password_detection/client.rb">get</a>() -> Auth0::Types::GetBreachedPasswordDetectionSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the Breached Password Detection configuration of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.breached_password_detection.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::BreachedPasswordDetection::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attack_protection.breached_password_detection.<a href="/lib/auth0/attack_protection/breached_password_detection/client.rb">update</a>(request) -> Auth0::Types::UpdateBreachedPasswordDetectionSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update details of the Breached Password Detection configuration of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.breached_password_detection.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether or not breached password detection is active.
    
</dd>
</dl>

<dl>
<dd>

**shields:** `Internal::Types::Array[Auth0::Types::BreachedPasswordDetectionShieldsEnum]` 

Action to take when a breached password is detected during a login.
      Possible values: <code>block</code>, <code>user_notification</code>, <code>admin_notification</code>.
    
</dd>
</dl>

<dl>
<dd>

**admin_notification_frequency:** `Internal::Types::Array[Auth0::Types::BreachedPasswordDetectionAdminNotificationFrequencyEnum]` 

When "admin_notification" is enabled, determines how often email notifications are sent.
        Possible values: <code>immediately</code>, <code>daily</code>, <code>weekly</code>, <code>monthly</code>.
    
</dd>
</dl>

<dl>
<dd>

**method_:** `Auth0::Types::BreachedPasswordDetectionMethodEnum` 
    
</dd>
</dl>

<dl>
<dd>

**stage:** `Auth0::Types::BreachedPasswordDetectionStage` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::BreachedPasswordDetection::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AttackProtection BruteForceProtection
<details><summary><code>client.attack_protection.brute_force_protection.<a href="/lib/auth0/attack_protection/brute_force_protection/client.rb">get</a>() -> Auth0::Types::GetBruteForceSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the Brute-force Protection configuration of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.brute_force_protection.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::BruteForceProtection::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attack_protection.brute_force_protection.<a href="/lib/auth0/attack_protection/brute_force_protection/client.rb">update</a>(request) -> Auth0::Types::UpdateBruteForceSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the Brute-force Protection configuration of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.brute_force_protection.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether or not brute force attack protections are active.
    
</dd>
</dl>

<dl>
<dd>

**shields:** `Internal::Types::Array[Auth0::Types::BruteForceProtectionShieldsEnum]` 

Action to take when a brute force protection threshold is violated.
        Possible values: <code>block</code>, <code>user_notification</code>.
    
</dd>
</dl>

<dl>
<dd>

**allowlist:** `Internal::Types::Array[String]` — List of trusted IP addresses that will not have attack protection enforced against them.
    
</dd>
</dl>

<dl>
<dd>

**mode:** `Auth0::Types::BruteForceProtectionModeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**max_attempts:** `Integer` — Maximum number of unsuccessful attempts.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::BruteForceProtection::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AttackProtection Captcha
<details><summary><code>client.attack_protection.captcha.<a href="/lib/auth0/attack_protection/captcha/client.rb">get</a>() -> Auth0::Types::GetAttackProtectionCaptchaResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the CAPTCHA configuration for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.captcha.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::Captcha::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attack_protection.captcha.<a href="/lib/auth0/attack_protection/captcha/client.rb">update</a>(request) -> Auth0::Types::UpdateAttackProtectionCaptchaResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update existing CAPTCHA configuration for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.captcha.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**active_provider_id:** `Auth0::Types::AttackProtectionCaptchaProviderID` 
    
</dd>
</dl>

<dl>
<dd>

**arkose:** `Auth0::Types::AttackProtectionUpdateCaptchaArkose` 
    
</dd>
</dl>

<dl>
<dd>

**auth_challenge:** `Auth0::Types::AttackProtectionCaptchaAuthChallengeRequest` 
    
</dd>
</dl>

<dl>
<dd>

**hcaptcha:** `Auth0::Types::AttackProtectionUpdateCaptchaHcaptcha` 
    
</dd>
</dl>

<dl>
<dd>

**friendly_captcha:** `Auth0::Types::AttackProtectionUpdateCaptchaFriendlyCaptcha` 
    
</dd>
</dl>

<dl>
<dd>

**recaptcha_enterprise:** `Auth0::Types::AttackProtectionUpdateCaptchaRecaptchaEnterprise` 
    
</dd>
</dl>

<dl>
<dd>

**recaptcha_v2:** `Auth0::Types::AttackProtectionUpdateCaptchaRecaptchaV2` 
    
</dd>
</dl>

<dl>
<dd>

**simple_captcha:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::Captcha::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AttackProtection SuspiciousIPThrottling
<details><summary><code>client.attack_protection.suspicious_ip_throttling.<a href="/lib/auth0/attack_protection/suspicious_ip_throttling/client.rb">get</a>() -> Auth0::Types::GetSuspiciousIPThrottlingSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the Suspicious IP Throttling configuration of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.suspicious_ip_throttling.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::SuspiciousIPThrottling::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attack_protection.suspicious_ip_throttling.<a href="/lib/auth0/attack_protection/suspicious_ip_throttling/client.rb">update</a>(request) -> Auth0::Types::UpdateSuspiciousIPThrottlingSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the details of the Suspicious IP Throttling configuration of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attack_protection.suspicious_ip_throttling.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether or not suspicious IP throttling attack protections are active.
    
</dd>
</dl>

<dl>
<dd>

**shields:** `Internal::Types::Array[Auth0::Types::SuspiciousIPThrottlingShieldsEnum]` 

Action to take when a suspicious IP throttling threshold is violated.
          Possible values: <code>block</code>, <code>admin_notification</code>.
    
</dd>
</dl>

<dl>
<dd>

**allowlist:** `Internal::Types::Array[String]` 
    
</dd>
</dl>

<dl>
<dd>

**stage:** `Auth0::Types::SuspiciousIPThrottlingStage` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::AttackProtection::SuspiciousIPThrottling::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Branding Templates
<details><summary><code>client.branding.templates.<a href="/lib/auth0/branding/templates/client.rb">get_universal_login</a>() -> Auth0::Types::GetUniversalLoginTemplateResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.templates.get_universal_login
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Branding::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.templates.<a href="/lib/auth0/branding/templates/client.rb">update_universal_login</a>(request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the Universal Login branding template.

<p>When <code>content-type</code> header is set to <code>application/json</code>:</p>
<pre>
{
  "template": "&lt;!DOCTYPE html&gt;{% assign resolved_dir = dir | default: "auto" %}&lt;html lang="{{locale}}" dir="{{resolved_dir}}"&gt;&lt;head&gt;{%- auth0:head -%}&lt;/head&gt;&lt;body class="_widget-auto-layout"&gt;{%- auth0:widget -%}&lt;/body&gt;&lt;/html&gt;"
}
</pre>

<p>
  When <code>content-type</code> header is set to <code>text/html</code>:
</p>
<pre>
&lt!DOCTYPE html&gt;
{% assign resolved_dir = dir | default: "auto" %}
&lt;html lang="{{locale}}" dir="{{resolved_dir}}"&gt;
  &lt;head&gt;
    {%- auth0:head -%}
  &lt;/head&gt;
  &lt;body class="_widget-auto-layout"&gt;
    {%- auth0:widget -%}
  &lt;/body&gt;
&lt;/html&gt;
</pre>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.templates.update_universal_login(request: "string")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Auth0::Types::UpdateUniversalLoginTemplateRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.templates.<a href="/lib/auth0/branding/templates/client.rb">delete_universal_login</a>() -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.templates.delete_universal_login
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Branding::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Branding Themes
<details><summary><code>client.branding.themes.<a href="/lib/auth0/branding/themes/client.rb">create</a>(request) -> Auth0::Types::CreateBrandingThemeResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create branding theme.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.themes.create(
  borders: {
    button_border_radius: 1.1,
    button_border_weight: 1.1,
    buttons_style: "pill",
    input_border_radius: 1.1,
    input_border_weight: 1.1,
    inputs_style: "pill",
    show_widget_shadow: true,
    widget_border_weight: 1.1,
    widget_corner_radius: 1.1
  },
  colors: {
    body_text: "body_text",
    error: "error",
    header: "header",
    icons: "icons",
    input_background: "input_background",
    input_border: "input_border",
    input_filled_text: "input_filled_text",
    input_labels_placeholders: "input_labels_placeholders",
    links_focused_components: "links_focused_components",
    primary_button: "primary_button",
    primary_button_label: "primary_button_label",
    secondary_button_border: "secondary_button_border",
    secondary_button_label: "secondary_button_label",
    success: "success",
    widget_background: "widget_background",
    widget_border: "widget_border"
  },
  fonts: {
    body_text: {
      bold: true,
      size: 1.1
    },
    buttons_text: {
      bold: true,
      size: 1.1
    },
    font_url: "font_url",
    input_labels: {
      bold: true,
      size: 1.1
    },
    links: {
      bold: true,
      size: 1.1
    },
    links_style: "normal",
    reference_text_size: 1.1,
    subtitle: {
      bold: true,
      size: 1.1
    },
    title: {
      bold: true,
      size: 1.1
    }
  },
  page_background: {
    background_color: "background_color",
    background_image_url: "background_image_url",
    page_layout: "center"
  },
  widget: {
    header_text_alignment: "center",
    logo_height: 1.1,
    logo_position: "center",
    logo_url: "logo_url",
    social_buttons_layout: "bottom"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**borders:** `Auth0::Types::BrandingThemeBorders` 
    
</dd>
</dl>

<dl>
<dd>

**colors:** `Auth0::Types::BrandingThemeColors` 
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `String` — Display Name
    
</dd>
</dl>

<dl>
<dd>

**fonts:** `Auth0::Types::BrandingThemeFonts` 
    
</dd>
</dl>

<dl>
<dd>

**page_background:** `Auth0::Types::BrandingThemePageBackground` 
    
</dd>
</dl>

<dl>
<dd>

**widget:** `Auth0::Types::BrandingThemeWidget` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Themes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.themes.<a href="/lib/auth0/branding/themes/client.rb">get_default</a>() -> Auth0::Types::GetBrandingDefaultThemeResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve default branding theme.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.themes.get_default
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Branding::Themes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.themes.<a href="/lib/auth0/branding/themes/client.rb">get</a>(theme_id) -> Auth0::Types::GetBrandingThemeResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve branding theme.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.themes.get(theme_id: "themeId")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**theme_id:** `String` — The ID of the theme
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Themes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.themes.<a href="/lib/auth0/branding/themes/client.rb">delete</a>(theme_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete branding theme.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.themes.delete(theme_id: "themeId")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**theme_id:** `String` — The ID of the theme
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Themes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.themes.<a href="/lib/auth0/branding/themes/client.rb">update</a>(theme_id, request) -> Auth0::Types::UpdateBrandingThemeResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update branding theme.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.themes.update(
  theme_id: "themeId",
  borders: {
    button_border_radius: 1.1,
    button_border_weight: 1.1,
    buttons_style: "pill",
    input_border_radius: 1.1,
    input_border_weight: 1.1,
    inputs_style: "pill",
    show_widget_shadow: true,
    widget_border_weight: 1.1,
    widget_corner_radius: 1.1
  },
  colors: {
    body_text: "body_text",
    error: "error",
    header: "header",
    icons: "icons",
    input_background: "input_background",
    input_border: "input_border",
    input_filled_text: "input_filled_text",
    input_labels_placeholders: "input_labels_placeholders",
    links_focused_components: "links_focused_components",
    primary_button: "primary_button",
    primary_button_label: "primary_button_label",
    secondary_button_border: "secondary_button_border",
    secondary_button_label: "secondary_button_label",
    success: "success",
    widget_background: "widget_background",
    widget_border: "widget_border"
  },
  fonts: {
    body_text: {
      bold: true,
      size: 1.1
    },
    buttons_text: {
      bold: true,
      size: 1.1
    },
    font_url: "font_url",
    input_labels: {
      bold: true,
      size: 1.1
    },
    links: {
      bold: true,
      size: 1.1
    },
    links_style: "normal",
    reference_text_size: 1.1,
    subtitle: {
      bold: true,
      size: 1.1
    },
    title: {
      bold: true,
      size: 1.1
    }
  },
  page_background: {
    background_color: "background_color",
    background_image_url: "background_image_url",
    page_layout: "center"
  },
  widget: {
    header_text_alignment: "center",
    logo_height: 1.1,
    logo_position: "center",
    logo_url: "logo_url",
    social_buttons_layout: "bottom"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**theme_id:** `String` — The ID of the theme
    
</dd>
</dl>

<dl>
<dd>

**borders:** `Auth0::Types::BrandingThemeBorders` 
    
</dd>
</dl>

<dl>
<dd>

**colors:** `Auth0::Types::BrandingThemeColors` 
    
</dd>
</dl>

<dl>
<dd>

**display_name:** `String` — Display Name
    
</dd>
</dl>

<dl>
<dd>

**fonts:** `Auth0::Types::BrandingThemeFonts` 
    
</dd>
</dl>

<dl>
<dd>

**page_background:** `Auth0::Types::BrandingThemePageBackground` 
    
</dd>
</dl>

<dl>
<dd>

**widget:** `Auth0::Types::BrandingThemeWidget` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Themes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Branding Phone Providers
<details><summary><code>client.branding.phone.providers.<a href="/lib/auth0/branding/phone/providers/client.rb">list</a>() -> Auth0::Types::ListBrandingPhoneProvidersResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of <a href="https://auth0.com/docs/customize/phone-messages/configure-phone-messaging-providers">phone providers</a> details set for a Tenant. A list of fields to include or exclude may also be specified.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.providers.list(disabled: true)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disabled:** `Internal::Types::Boolean` — Whether the provider is enabled (false) or disabled (true).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Providers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.providers.<a href="/lib/auth0/branding/phone/providers/client.rb">create</a>(request) -> Auth0::Types::CreateBrandingPhoneProviderResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a <a href="https://auth0.com/docs/customize/phone-messages/configure-phone-messaging-providers">phone provider</a>.
The <code>credentials</code> object requires different properties depending on the phone provider (which is specified using the <code>name</code> property).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.providers.create(
  name: "twilio",
  credentials: {
    auth_token: "auth_token"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `Auth0::Types::PhoneProviderNameEnum` 
    
</dd>
</dl>

<dl>
<dd>

**disabled:** `Internal::Types::Boolean` — Whether the provider is enabled (false) or disabled (true).
    
</dd>
</dl>

<dl>
<dd>

**configuration:** `Auth0::Types::PhoneProviderConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**credentials:** `Auth0::Types::PhoneProviderCredentials` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Providers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.providers.<a href="/lib/auth0/branding/phone/providers/client.rb">get</a>(id) -> Auth0::Types::GetBrandingPhoneProviderResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve <a href="https://auth0.com/docs/customize/phone-messages/configure-phone-messaging-providers">phone provider</a> details. A list of fields to include or exclude may also be specified.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.providers.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Providers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.providers.<a href="/lib/auth0/branding/phone/providers/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete the configured phone provider.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.providers.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Providers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.providers.<a href="/lib/auth0/branding/phone/providers/client.rb">update</a>(id, request) -> Auth0::Types::UpdateBrandingPhoneProviderResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a <a href="https://auth0.com/docs/customize/phone-messages/configure-phone-messaging-providers">phone provider</a>.
The <code>credentials</code> object requires different properties depending on the phone provider (which is specified using the <code>name</code> property).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.providers.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `Auth0::Types::PhoneProviderNameEnum` 
    
</dd>
</dl>

<dl>
<dd>

**disabled:** `Internal::Types::Boolean` — Whether the provider is enabled (false) or disabled (true).
    
</dd>
</dl>

<dl>
<dd>

**credentials:** `Auth0::Types::PhoneProviderCredentials` 
    
</dd>
</dl>

<dl>
<dd>

**configuration:** `Auth0::Types::PhoneProviderConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Providers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.providers.<a href="/lib/auth0/branding/phone/providers/client.rb">test</a>(id, request) -> Auth0::Types::CreatePhoneProviderSendTestResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.providers.test(
  id: "id",
  to: "to"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — The recipient phone number to receive a given notification.
    
</dd>
</dl>

<dl>
<dd>

**delivery_method:** `Auth0::Types::PhoneProviderDeliveryMethodEnum` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Providers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Branding Phone Templates
<details><summary><code>client.branding.phone.templates.<a href="/lib/auth0/branding/phone/templates/client.rb">list</a>() -> Auth0::Types::ListPhoneTemplatesResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.templates.list(disabled: true)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disabled:** `Internal::Types::Boolean` — Whether the template is enabled (false) or disabled (true).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.templates.<a href="/lib/auth0/branding/phone/templates/client.rb">create</a>(request) -> Auth0::Types::CreatePhoneTemplateResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.templates.create
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**type:** `Auth0::Types::PhoneTemplateNotificationTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**disabled:** `Internal::Types::Boolean` — Whether the template is enabled (false) or disabled (true).
    
</dd>
</dl>

<dl>
<dd>

**content:** `Auth0::Types::PhoneTemplateContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.templates.<a href="/lib/auth0/branding/phone/templates/client.rb">get</a>(id) -> Auth0::Types::GetPhoneTemplateResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.templates.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.templates.<a href="/lib/auth0/branding/phone/templates/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.templates.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.templates.<a href="/lib/auth0/branding/phone/templates/client.rb">update</a>(id, request) -> Auth0::Types::UpdatePhoneTemplateResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.templates.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**content:** `Auth0::Types::PartialPhoneTemplateContent` 
    
</dd>
</dl>

<dl>
<dd>

**disabled:** `Internal::Types::Boolean` — Whether the template is enabled (false) or disabled (true).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.templates.<a href="/lib/auth0/branding/phone/templates/client.rb">reset</a>(id, request) -> Auth0::Types::ResetPhoneTemplateResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.templates.reset(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Object` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.branding.phone.templates.<a href="/lib/auth0/branding/phone/templates/client.rb">test</a>(id, request) -> Auth0::Types::CreatePhoneTemplateTestNotificationResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.branding.phone.templates.test(
  id: "id",
  to: "to"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — Destination of the testing phone notification
    
</dd>
</dl>

<dl>
<dd>

**delivery_method:** `Auth0::Types::PhoneProviderDeliveryMethodEnum` — Medium to use to send the notification
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Branding::Phone::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ClientGrants Organizations
<details><summary><code>client.client_grants.organizations.<a href="/lib/auth0/client_grants/organizations/client.rb">list</a>(id) -> Auth0::Types::ListClientGrantOrganizationsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.client_grants.organizations.list(
  id: "id",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the client grant
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::ClientGrants::Organizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Clients Credentials
<details><summary><code>client.clients.credentials.<a href="/lib/auth0/clients/credentials/client.rb">list</a>(client_id) -> Internal::Types::Array[Auth0::Types::ClientCredential]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the details of a client credential.

<b>Important</b>: To enable credentials to be used for a client authentication method, set the <code>client_authentication_methods</code> property on the client. To enable credentials to be used for JWT-Secured Authorization requests set the <code>signed_request_object</code> property on the client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.credentials.list(client_id: "client_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_id:** `String` — ID of the client.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.credentials.<a href="/lib/auth0/clients/credentials/client.rb">create</a>(client_id, request) -> Auth0::Types::PostClientCredentialResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a client credential associated to your application. Credentials can be used to configure Private Key JWT and mTLS authentication methods, as well as for JWT-secured Authorization requests.

<h5>Public Key</h5>Public Key credentials can be used to set up Private Key JWT client authentication and JWT-secured Authorization requests.

Sample: <pre><code>{
  "credential_type": "public_key",
  "name": "string",
  "pem": "string",
  "alg": "RS256",
  "parse_expiry_from_cert": false,
  "expires_at": "2022-12-31T23:59:59Z"
}</code></pre>
<h5>Certificate (CA-signed & self-signed)</h5>Certificate credentials can be used to set up mTLS client authentication. CA-signed certificates can be configured either with a signed certificate or with just the certificate Subject DN.

CA-signed Certificate Sample (pem): <pre><code>{
  "credential_type": "x509_cert",
  "name": "string",
  "pem": "string"
}</code></pre>CA-signed Certificate Sample (subject_dn): <pre><code>{
  "credential_type": "cert_subject_dn",
  "name": "string",
  "subject_dn": "string"
}</code></pre>Self-signed Certificate Sample: <pre><code>{
  "credential_type": "cert_subject_dn",
  "name": "string",
  "pem": "string"
}</code></pre>

The credential will be created but not yet enabled for use until you set the corresponding properties in the client:
<ul>
  <li>To enable the credential for Private Key JWT or mTLS authentication methods, set the <code>client_authentication_methods</code> property on the client. For more information, read <a href="https://auth0.com/docs/get-started/applications/configure-private-key-jwt">Configure Private Key JWT Authentication</a> and <a href="https://auth0.com/docs/get-started/applications/configure-mtls">Configure mTLS Authentication</a></li>
  <li>To enable the credential for JWT-secured Authorization requests, set the <code>signed_request_object</code>property on the client. For more information, read <a href="https://auth0.com/docs/get-started/applications/configure-jar">Configure JWT-secured Authorization Requests (JAR)</a></li>
</ul>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.credentials.create(
  client_id: "client_id",
  credential_type: "public_key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_id:** `String` — ID of the client.
    
</dd>
</dl>

<dl>
<dd>

**credential_type:** `Auth0::Types::ClientCredentialTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Friendly name for a credential.
    
</dd>
</dl>

<dl>
<dd>

**subject_dn:** `String` — Subject Distinguished Name. Mutually exclusive with `pem` property. Applies to `cert_subject_dn` credential type.
    
</dd>
</dl>

<dl>
<dd>

**pem:** `String` — PEM-formatted public key (SPKI and PKCS1) or X509 certificate. Must be JSON escaped.
    
</dd>
</dl>

<dl>
<dd>

**alg:** `Auth0::Types::PublicKeyCredentialAlgorithmEnum` 
    
</dd>
</dl>

<dl>
<dd>

**parse_expiry_from_cert:** `Internal::Types::Boolean` — Parse expiry from x509 certificate. If true, attempts to parse the expiry date from the provided PEM. Applies to `public_key` credential type.
    
</dd>
</dl>

<dl>
<dd>

**expires_at:** `String` — The ISO 8601 formatted date representing the expiration of the credential. If not specified (not recommended), the credential never expires. Applies to `public_key` credential type.
    
</dd>
</dl>

<dl>
<dd>

**kid:** `String` — Optional kid (Key ID), used to uniquely identify the credential. If not specified, a kid value will be auto-generated. The kid header parameter in JWTs sent by your client should match this value. Valid format is [0-9a-zA-Z-_]{10,64}
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.credentials.<a href="/lib/auth0/clients/credentials/client.rb">get</a>(client_id, credential_id) -> Auth0::Types::GetClientCredentialResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the details of a client credential.

<b>Important</b>: To enable credentials to be used for a client authentication method, set the <code>client_authentication_methods</code> property on the client. To enable credentials to be used for JWT-Secured Authorization requests set the <code>signed_request_object</code> property on the client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.credentials.get(
  client_id: "client_id",
  credential_id: "credential_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_id:** `String` — ID of the client.
    
</dd>
</dl>

<dl>
<dd>

**credential_id:** `String` — ID of the credential.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.credentials.<a href="/lib/auth0/clients/credentials/client.rb">delete</a>(client_id, credential_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a client credential you previously created. May be enabled or disabled. For more information, read <a href="https://www.auth0.com/docs/get-started/authentication-and-authorization-flow/client-credentials-flow">Client Credential Flow</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.credentials.delete(
  client_id: "client_id",
  credential_id: "credential_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_id:** `String` — ID of the client.
    
</dd>
</dl>

<dl>
<dd>

**credential_id:** `String` — ID of the credential to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.clients.credentials.<a href="/lib/auth0/clients/credentials/client.rb">update</a>(client_id, credential_id, request) -> Auth0::Types::PatchClientCredentialResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Change a client credential you previously created. May be enabled or disabled. For more information, read <a href="https://www.auth0.com/docs/get-started/authentication-and-authorization-flow/client-credentials-flow">Client Credential Flow</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.credentials.update(
  client_id: "client_id",
  credential_id: "credential_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_id:** `String` — ID of the client.
    
</dd>
</dl>

<dl>
<dd>

**credential_id:** `String` — ID of the credential.
    
</dd>
</dl>

<dl>
<dd>

**expires_at:** `String` — The ISO 8601 formatted date representing the expiration of the credential.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Clients Connections
<details><summary><code>client.clients.connections.<a href="/lib/auth0/clients/connections/client.rb">get</a>(id) -> Auth0::Types::ListClientConnectionsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all connections that are enabled for the specified <a href="https://www.auth0.com/docs/get-started/applications"> Application</a>, using checkpoint pagination. A list of fields to include or exclude for each connection may also be specified.
<ul>
  <li>
    This endpoint requires the <code>read:connections</code> scope and any one of <code>read:clients</code> or <code>read:client_summary</code>.
  </li>
  <li>
    <b>Note</b>: The first time you call this endpoint, omit the <code>from</code> parameter. If there are more results, a <code>next</code> value is included in the response. You can use this for subsequent API calls. When <code>next</code> is no longer included in the response, no further results are remaining.
  </li>
</ul>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.clients.connections.get(
  id: "id",
  from: "from",
  take: 1,
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the client for which to retrieve enabled connections.
    
</dd>
</dl>

<dl>
<dd>

**strategy:** `Auth0::Types::ConnectionStrategyEnum` — Provide strategies to only retrieve connections with such strategies
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — A comma separated list of fields to include or exclude (depending on include_fields) from the result, empty to retrieve all fields
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — <code>true</code> if the fields specified are to be included in the result, <code>false</code> otherwise (defaults to <code>true</code>)
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Clients::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Connections DirectoryProvisioning
<details><summary><code>client.connections.directory_provisioning.<a href="/lib/auth0/connections/directory_provisioning/client.rb">list</a>() -> Auth0::Types::ListDirectoryProvisioningsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of directory provisioning configurations of a tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.list(
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.directory_provisioning.<a href="/lib/auth0/connections/directory_provisioning/client.rb">get</a>(id) -> Auth0::Types::GetDirectoryProvisioningResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the directory provisioning configuration of a connection.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to retrieve its directory provisioning configuration
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.directory_provisioning.<a href="/lib/auth0/connections/directory_provisioning/client.rb">create</a>(id, request) -> Auth0::Types::CreateDirectoryProvisioningResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a directory provisioning configuration for a connection.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.create(
  id: "id",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to create its directory provisioning configuration
    
</dd>
</dl>

<dl>
<dd>

**request:** `Auth0::Types::CreateDirectoryProvisioningRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.directory_provisioning.<a href="/lib/auth0/connections/directory_provisioning/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete the directory provisioning configuration of a connection.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to delete its directory provisioning configuration
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.directory_provisioning.<a href="/lib/auth0/connections/directory_provisioning/client.rb">update</a>(id, request) -> Auth0::Types::UpdateDirectoryProvisioningResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the directory provisioning configuration of a connection.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.update(
  id: "id",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to create its directory provisioning configuration
    
</dd>
</dl>

<dl>
<dd>

**request:** `Auth0::Types::UpdateDirectoryProvisioningRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.directory_provisioning.<a href="/lib/auth0/connections/directory_provisioning/client.rb">get_default_mapping</a>(id) -> Auth0::Types::GetDirectoryProvisioningDefaultMappingResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the directory provisioning default attribute mapping of a connection.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.get_default_mapping(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to retrieve its directory provisioning configuration
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.directory_provisioning.<a href="/lib/auth0/connections/directory_provisioning/client.rb">list_synchronized_groups</a>(id) -> Auth0::Types::ListSynchronizedGroupsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the configured synchronized groups for a connection directory provisioning configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.list_synchronized_groups(
  id: "id",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to list synchronized groups for.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.directory_provisioning.<a href="/lib/auth0/connections/directory_provisioning/client.rb">set</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create or replace the selected groups for a connection directory provisioning configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.set(
  id: "id",
  groups: [{
    id: "id"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to create or replace synchronized groups for
    
</dd>
</dl>

<dl>
<dd>

**groups:** `Internal::Types::Array[Auth0::Types::SynchronizedGroupPayload]` — Array of Google Workspace Directory group objects to synchronize.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Connections SCIMConfiguration
<details><summary><code>client.connections.scim_configuration.<a href="/lib/auth0/connections/scim_configuration/client.rb">list</a>() -> Auth0::Types::ListSCIMConfigurationsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of SCIM configurations of a tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.list(
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.scim_configuration.<a href="/lib/auth0/connections/scim_configuration/client.rb">get</a>(id) -> Auth0::Types::GetSCIMConfigurationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a scim configuration by its <code>connectionId</code>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to retrieve its SCIM configuration
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.scim_configuration.<a href="/lib/auth0/connections/scim_configuration/client.rb">create</a>(id, request) -> Auth0::Types::CreateSCIMConfigurationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a scim configuration for a connection.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.create(
  id: "id",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to create its SCIM configuration
    
</dd>
</dl>

<dl>
<dd>

**request:** `Auth0::Types::CreateSCIMConfigurationRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.scim_configuration.<a href="/lib/auth0/connections/scim_configuration/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a scim configuration by its <code>connectionId</code>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to delete its SCIM configuration
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.scim_configuration.<a href="/lib/auth0/connections/scim_configuration/client.rb">update</a>(id, request) -> Auth0::Types::UpdateSCIMConfigurationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a scim configuration by its <code>connectionId</code>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.update(
  id: "id",
  user_id_attribute: "user_id_attribute",
  mapping: [{}]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to update its SCIM configuration
    
</dd>
</dl>

<dl>
<dd>

**user_id_attribute:** `String` — User ID attribute for generating unique user ids
    
</dd>
</dl>

<dl>
<dd>

**mapping:** `Internal::Types::Array[Auth0::Types::SCIMMappingItem]` — The mapping between auth0 and SCIM
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.scim_configuration.<a href="/lib/auth0/connections/scim_configuration/client.rb">get_default_mapping</a>(id) -> Auth0::Types::GetSCIMConfigurationDefaultMappingResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a scim configuration's default mapping by its <code>connectionId</code>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.get_default_mapping(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to retrieve its default SCIM mapping
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Connections Clients
<details><summary><code>client.connections.clients.<a href="/lib/auth0/connections/clients/client.rb">get</a>(id) -> Auth0::Types::GetConnectionEnabledClientsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all clients that have the specified <a href="https://auth0.com/docs/authenticate/identity-providers">connection</a> enabled.

<b>Note</b>: The first time you call this endpoint, omit the <code>from</code> parameter. If there are more results, a <code>next</code> value is included in the response. You can use this for subsequent API calls. When <code>next</code> is no longer included in the response, no further results are remaining.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.clients.get(
  id: "id",
  take: 1,
  from: "from"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection for which enabled clients are to be retrieved
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.clients.<a href="/lib/auth0/connections/clients/client.rb">update</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.clients.update(
  id: "id",
  request: [{
    client_id: "client_id",
    status: true
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to modify
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Auth0::Types::UpdateEnabledClientConnectionsRequestContentItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::Clients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Connections Keys
<details><summary><code>client.connections.keys.<a href="/lib/auth0/connections/keys/client.rb">get</a>(id) -> Internal::Types::Array[Auth0::Types::ConnectionKey]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets the connection keys for the Okta or OIDC connection strategy.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.keys.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the connection
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::Keys::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.keys.<a href="/lib/auth0/connections/keys/client.rb">create</a>(id, request) -> Internal::Types::Array[Auth0::Types::PostConnectionsKeysResponseContentItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provision initial connection keys for Okta or OIDC connection strategies. This endpoint allows you to create keys before configuring the connection to use Private Key JWT authentication, enabling zero-downtime transitions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.keys.create(
  id: "id",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the connection
    
</dd>
</dl>

<dl>
<dd>

**request:** `Auth0::Types::PostConnectionKeysRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::Keys::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.keys.<a href="/lib/auth0/connections/keys/client.rb">rotate</a>(id, request) -> Auth0::Types::RotateConnectionsKeysResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Rotates the connection keys for the Okta or OIDC connection strategies.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.keys.rotate(
  id: "id",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the connection
    
</dd>
</dl>

<dl>
<dd>

**request:** `Auth0::Types::RotateConnectionKeysRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::Keys::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Connections Users
<details><summary><code>client.connections.users.<a href="/lib/auth0/connections/users/client.rb">delete_by_email</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a specified connection user by its email (you cannot delete all users from specific connection). Currently, only Database Connections are supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.users.delete_by_email(
  id: "id",
  email: "email"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection (currently only database connections are supported)
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — The email of the user to delete
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Connections DirectoryProvisioning Synchronizations
<details><summary><code>client.connections.directory_provisioning.synchronizations.<a href="/lib/auth0/connections/directory_provisioning/synchronizations/client.rb">create</a>(id) -> Auth0::Types::CreateDirectorySynchronizationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Request an on-demand synchronization of the directory.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.directory_provisioning.synchronizations.create(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to trigger synchronization for
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::DirectoryProvisioning::Synchronizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Connections SCIMConfiguration Tokens
<details><summary><code>client.connections.scim_configuration.tokens.<a href="/lib/auth0/connections/scim_configuration/tokens/client.rb">get</a>(id) -> Internal::Types::Array[Auth0::Types::SCIMTokenItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves all scim tokens by its connection <code>id</code>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.tokens.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to retrieve its SCIM configuration
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::Tokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.scim_configuration.tokens.<a href="/lib/auth0/connections/scim_configuration/tokens/client.rb">create</a>(id, request) -> Auth0::Types::CreateSCIMTokenResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a scim token for a scim client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.tokens.create(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the connection to create its SCIM token
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `Internal::Types::Array[String]` — The scopes of the scim token
    
</dd>
</dl>

<dl>
<dd>

**token_lifetime:** `Integer` — Lifetime of the token in seconds. Must be greater than 900
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::Tokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.connections.scim_configuration.tokens.<a href="/lib/auth0/connections/scim_configuration/tokens/client.rb">delete</a>(id, token_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a scim token by its connection <code>id</code> and <code>tokenId</code>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.connections.scim_configuration.tokens.delete(
  id: "id",
  token_id: "tokenId"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The connection id that owns the SCIM token to delete
    
</dd>
</dl>

<dl>
<dd>

**token_id:** `String` — The id of the scim token to delete
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Connections::SCIMConfiguration::Tokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Emails Provider
<details><summary><code>client.emails.provider.<a href="/lib/auth0/emails/provider/client.rb">get</a>() -> Auth0::Types::GetEmailProviderResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the <a href="https://auth0.com/docs/customize/email/smtp-email-providers">email provider configuration</a> in your tenant. A list of fields to include or exclude may also be specified.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.emails.provider.get(
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (dependent upon include_fields) from the result. Leave empty to retrieve `name` and `enabled`. Additional fields available include `credentials`, `default_from_address`, and `settings`.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Emails::Provider::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emails.provider.<a href="/lib/auth0/emails/provider/client.rb">create</a>(request) -> Auth0::Types::CreateEmailProviderResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an <a href="https://auth0.com/docs/email/providers">email provider</a>. The <code>credentials</code> object
requires different properties depending on the email provider (which is specified using the <code>name</code> property):
<ul>
  <li><code>mandrill</code> requires <code>api_key</code></li>
  <li><code>sendgrid</code> requires <code>api_key</code></li>
  <li>
    <code>sparkpost</code> requires <code>api_key</code>. Optionally, set <code>region</code> to <code>eu</code> to use
    the SparkPost service hosted in Western Europe; set to <code>null</code> to use the SparkPost service hosted in
    North America. <code>eu</code> or <code>null</code> are the only valid values for <code>region</code>.
  </li>
  <li>
    <code>mailgun</code> requires <code>api_key</code> and <code>domain</code>. Optionally, set <code>region</code> to
    <code>eu</code> to use the Mailgun service hosted in Europe; set to <code>null</code> otherwise. <code>eu</code> or
    <code>null</code> are the only valid values for <code>region</code>.
  </li>
  <li><code>ses</code> requires <code>accessKeyId</code>, <code>secretAccessKey</code>, and <code>region</code></li>
  <li>
    <code>smtp</code> requires <code>smtp_host</code>, <code>smtp_port</code>, <code>smtp_user</code>, and
    <code>smtp_pass</code>
  </li>
</ul>
Depending on the type of provider it is possible to specify <code>settings</code> object with different configuration
options, which will be used when sending an email:
<ul>
  <li>
    <code>smtp</code> provider, <code>settings</code> may contain <code>headers</code> object.
    <ul>
      <li>
        When using AWS SES SMTP host, you may provide a name of configuration set in
        <code>X-SES-Configuration-Set</code> header. Value must be a string.
      </li>
      <li>
        When using Sparkpost host, you may provide value for
        <code>X-MSYS_API</code> header. Value must be an object.
      </li>
    </ul>
  </li>
  <li>
    for <code>ses</code> provider, <code>settings</code> may contain <code>message</code> object, where you can provide
    a name of configuration set in <code>configuration_set_name</code> property. Value must be a string.
  </li>
</ul>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.emails.provider.create(
  name: "mailgun",
  credentials: {
    api_key: "api_key"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `Auth0::Types::EmailProviderNameEnum` 
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether the provider is enabled (true) or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**default_from_address:** `String` — Email address to use as "from" when no other address specified.
    
</dd>
</dl>

<dl>
<dd>

**credentials:** `Auth0::Types::EmailProviderCredentialsSchema` 
    
</dd>
</dl>

<dl>
<dd>

**settings:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Emails::Provider::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emails.provider.<a href="/lib/auth0/emails/provider/client.rb">delete</a>() -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete the email provider.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.emails.provider.delete
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Emails::Provider::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emails.provider.<a href="/lib/auth0/emails/provider/client.rb">update</a>(request) -> Auth0::Types::UpdateEmailProviderResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an <a href="https://auth0.com/docs/email/providers">email provider</a>. The <code>credentials</code> object
requires different properties depending on the email provider (which is specified using the <code>name</code> property):
<ul>
  <li><code>mandrill</code> requires <code>api_key</code></li>
  <li><code>sendgrid</code> requires <code>api_key</code></li>
  <li>
    <code>sparkpost</code> requires <code>api_key</code>. Optionally, set <code>region</code> to <code>eu</code> to use
    the SparkPost service hosted in Western Europe; set to <code>null</code> to use the SparkPost service hosted in
    North America. <code>eu</code> or <code>null</code> are the only valid values for <code>region</code>.
  </li>
  <li>
    <code>mailgun</code> requires <code>api_key</code> and <code>domain</code>. Optionally, set <code>region</code> to
    <code>eu</code> to use the Mailgun service hosted in Europe; set to <code>null</code> otherwise. <code>eu</code> or
    <code>null</code> are the only valid values for <code>region</code>.
  </li>
  <li><code>ses</code> requires <code>accessKeyId</code>, <code>secretAccessKey</code>, and <code>region</code></li>
  <li>
    <code>smtp</code> requires <code>smtp_host</code>, <code>smtp_port</code>, <code>smtp_user</code>, and
    <code>smtp_pass</code>
  </li>
</ul>
Depending on the type of provider it is possible to specify <code>settings</code> object with different configuration
options, which will be used when sending an email:
<ul>
  <li>
    <code>smtp</code> provider, <code>settings</code> may contain <code>headers</code> object.
    <ul>
      <li>
        When using AWS SES SMTP host, you may provide a name of configuration set in
        <code>X-SES-Configuration-Set</code> header. Value must be a string.
      </li>
      <li>
        When using Sparkpost host, you may provide value for
        <code>X-MSYS_API</code> header. Value must be an object.
      </li>
    </ul>
    for <code>ses</code> provider, <code>settings</code> may contain <code>message</code> object, where you can provide
    a name of configuration set in <code>configuration_set_name</code> property. Value must be a string.
  </li>
</ul>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.emails.provider.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `Auth0::Types::EmailProviderNameEnum` 
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether the provider is enabled (true) or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**default_from_address:** `String` — Email address to use as "from" when no other address specified.
    
</dd>
</dl>

<dl>
<dd>

**credentials:** `Auth0::Types::EmailProviderCredentialsSchema` 
    
</dd>
</dl>

<dl>
<dd>

**settings:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Emails::Provider::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EventStreams Deliveries
<details><summary><code>client.event_streams.deliveries.<a href="/lib/auth0/event_streams/deliveries/client.rb">list</a>(id) -> Internal::Types::Array[Auth0::Types::EventStreamDelivery]</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.deliveries.list(
  id: "id",
  statuses: "statuses",
  event_types: "event_types",
  date_from: "date_from",
  date_to: "date_to",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the event stream.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `String` — Comma-separated list of statuses by which to filter
    
</dd>
</dl>

<dl>
<dd>

**event_types:** `String` — Comma-separated list of event types by which to filter
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — An RFC-3339 date-time for redelivery start, inclusive. Does not allow sub-second precision.
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — An RFC-3339 date-time for redelivery end, exclusive. Does not allow sub-second precision.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::Deliveries::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.event_streams.deliveries.<a href="/lib/auth0/event_streams/deliveries/client.rb">get_history</a>(id, event_id) -> Auth0::Types::GetEventStreamDeliveryHistoryResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.deliveries.get_history(
  id: "id",
  event_id: "event_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the event stream.
    
</dd>
</dl>

<dl>
<dd>

**event_id:** `String` — Unique identifier for the event
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::Deliveries::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EventStreams Redeliveries
<details><summary><code>client.event_streams.redeliveries.<a href="/lib/auth0/event_streams/redeliveries/client.rb">create</a>(id, request) -> Auth0::Types::CreateEventStreamRedeliveryResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.redeliveries.create(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the event stream.
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — An RFC-3339 date-time for redelivery start, inclusive. Does not allow sub-second precision.
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — An RFC-3339 date-time for redelivery end, exclusive. Does not allow sub-second precision.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `Internal::Types::Array[Auth0::Types::EventStreamDeliveryStatusEnum]` — Filter by status
    
</dd>
</dl>

<dl>
<dd>

**event_types:** `Internal::Types::Array[Auth0::Types::EventStreamEventTypeEnum]` — Filter by event type
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::Redeliveries::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.event_streams.redeliveries.<a href="/lib/auth0/event_streams/redeliveries/client.rb">create_by_id</a>(id, event_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.event_streams.redeliveries.create_by_id(
  id: "id",
  event_id: "event_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the event stream.
    
</dd>
</dl>

<dl>
<dd>

**event_id:** `String` — Unique identifier for the event
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::EventStreams::Redeliveries::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Flows Executions
<details><summary><code>client.flows.executions.<a href="/lib/auth0/flows/executions/client.rb">list</a>(flow_id) -> Auth0::Types::ListFlowExecutionsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.executions.list(
  flow_id: "flow_id",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**flow_id:** `String` — Flow id
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::Executions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.executions.<a href="/lib/auth0/flows/executions/client.rb">get</a>(flow_id, execution_id) -> Auth0::Types::GetFlowExecutionResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.executions.get(
  flow_id: "flow_id",
  execution_id: "execution_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**flow_id:** `String` — Flow id
    
</dd>
</dl>

<dl>
<dd>

**execution_id:** `String` — Flow execution id
    
</dd>
</dl>

<dl>
<dd>

**hydrate:** `Auth0::Types::GetFlowExecutionRequestParametersHydrateEnum` — Hydration param
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::Executions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.executions.<a href="/lib/auth0/flows/executions/client.rb">delete</a>(flow_id, execution_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.executions.delete(
  flow_id: "flow_id",
  execution_id: "execution_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**flow_id:** `String` — Flows id
    
</dd>
</dl>

<dl>
<dd>

**execution_id:** `String` — Flow execution identifier
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::Executions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Flows Vault Connections
<details><summary><code>client.flows.vault.connections.<a href="/lib/auth0/flows/vault/connections/client.rb">list</a>() -> Auth0::Types::ListFlowsVaultConnectionsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.vault.connections.list(
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::Vault::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.vault.connections.<a href="/lib/auth0/flows/vault/connections/client.rb">create</a>(request) -> Auth0::Types::CreateFlowsVaultConnectionResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.vault.connections.create(request: {
  name: "name",
  app_id: "ACTIVECAMPAIGN",
  setup: {
    type: "API_KEY",
    api_key: "api_key",
    base_url: "base_url"
  }
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Auth0::Types::CreateFlowsVaultConnectionRequestContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::Vault::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.vault.connections.<a href="/lib/auth0/flows/vault/connections/client.rb">get</a>(id) -> Auth0::Types::GetFlowsVaultConnectionResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.vault.connections.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Flows Vault connection ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::Vault::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.vault.connections.<a href="/lib/auth0/flows/vault/connections/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.vault.connections.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Vault connection id
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::Vault::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.flows.vault.connections.<a href="/lib/auth0/flows/vault/connections/client.rb">update</a>(id, request) -> Auth0::Types::UpdateFlowsVaultConnectionResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.vault.connections.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Flows Vault connection ID
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Flows Vault Connection name.
    
</dd>
</dl>

<dl>
<dd>

**setup:** `Auth0::Types::UpdateFlowsVaultConnectionSetup` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Flows::Vault::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Groups Members
<details><summary><code>client.groups.members.<a href="/lib/auth0/groups/members/client.rb">get</a>(id) -> Auth0::Types::GetGroupMembersResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all users that are a member of this group.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.groups.members.get(
  id: "id",
  fields: "fields",
  include_fields: true,
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier for the group (service-generated).
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — A comma separated list of fields to include or exclude (depending on include_fields) from the result, empty to retrieve all fields
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Groups::Members::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Guardian Enrollments
<details><summary><code>client.guardian.enrollments.<a href="/lib/auth0/guardian/enrollments/client.rb">create_ticket</a>(request) -> Auth0::Types::CreateGuardianEnrollmentTicketResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a <a href="https://auth0.com/docs/secure/multi-factor-authentication/auth0-guardian/create-custom-enrollment-tickets">multi-factor authentication (MFA) enrollment ticket</a>, and optionally send an email with the created ticket, to a given user.
Create a <a href="https://auth0.com/docs/secure/multi-factor-authentication/auth0-guardian/create-custom-enrollment-tickets">multi-factor authentication (MFA) enrollment ticket</a>, and optionally send an email with the created ticket to a given user. Enrollment tickets can specify which factor users must enroll with or allow existing MFA users to enroll in additional factors.<br/> 

Note: Users cannot enroll in Email as a factor through custom enrollment tickets. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.enrollments.create_ticket(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — user_id for the enrollment ticket
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — alternate email to which the enrollment email will be sent. Optional - by default, the email will be sent to the user's default address
    
</dd>
</dl>

<dl>
<dd>

**send_mail:** `Internal::Types::Boolean` — Send an email to the user to start the enrollment
    
</dd>
</dl>

<dl>
<dd>

**email_locale:** `String` — Optional. Specify the locale of the enrollment email. Used with send_email.
    
</dd>
</dl>

<dl>
<dd>

**factor:** `Auth0::Types::GuardianEnrollmentFactorEnum` 
    
</dd>
</dl>

<dl>
<dd>

**allow_multiple_enrollments:** `Internal::Types::Boolean` — Optional. Allows a user who has previously enrolled in MFA to enroll with additional factors.<br />Note: Parameter can only be used with Universal Login; it cannot be used with Classic Login or custom MFA pages.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Enrollments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.enrollments.<a href="/lib/auth0/guardian/enrollments/client.rb">get</a>(id) -> Auth0::Types::GetGuardianEnrollmentResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details, such as status and type, for a specific multi-factor authentication enrollment registered to a user account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.enrollments.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the enrollment to be retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Enrollments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.enrollments.<a href="/lib/auth0/guardian/enrollments/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove a specific multi-factor authentication (MFA) enrollment from a user's account. This allows the user to re-enroll with MFA. For more information, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/reset-user-mfa">Reset User Multi-Factor Authentication and Recovery Codes</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.enrollments.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the enrollment to be deleted.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Enrollments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Guardian Factors
<details><summary><code>client.guardian.factors.<a href="/lib/auth0/guardian/factors/client.rb">list</a>() -> Internal::Types::Array[Auth0::Types::GuardianFactor]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of all <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors">multi-factor authentication factors</a> associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.<a href="/lib/auth0/guardian/factors/client.rb">set</a>(name, request) -> Auth0::Types::SetGuardianFactorResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the status (i.e., enabled or disabled) of a specific multi-factor authentication factor.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.set(
  name: "push-notification",
  enabled: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `Auth0::Types::GuardianFactorNameEnum` — Factor name. Can be `sms`, `push-notification`, `email`, `duo` `otp` `webauthn-roaming`, `webauthn-platform`, or `recovery-code`.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether this factor is enabled (true) or disabled (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Guardian Policies
<details><summary><code>client.guardian.policies.<a href="/lib/auth0/guardian/policies/client.rb">list</a>() -> Internal::Types::Array[Auth0::Types::MfaPolicyEnum]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the <a href="https://auth0.com/docs/secure/multi-factor-authentication/enable-mfa">multi-factor authentication (MFA) policies</a> configured for your tenant.

The following policies are supported:
<ul>
<li><code>all-applications</code> policy prompts with MFA for all logins.</li>
<li><code>confidence-score</code> policy prompts with MFA only for low confidence logins.</li>
</ul>

<b>Note</b>: The <code>confidence-score</code> policy is part of the <a href="https://auth0.com/docs/secure/multi-factor-authentication/adaptive-mfa">Adaptive MFA feature</a>. Adaptive MFA requires an add-on for the Enterprise plan; review <a href="https://auth0.com/pricing">Auth0 Pricing</a> for more details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.policies.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Policies::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.policies.<a href="/lib/auth0/guardian/policies/client.rb">set</a>(request) -> Internal::Types::Array[Auth0::Types::MfaPolicyEnum]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Set <a href="https://auth0.com/docs/secure/multi-factor-authentication/enable-mfa">multi-factor authentication (MFA) policies</a> for your tenant.

The following policies are supported:
<ul>
<li><code>all-applications</code> policy prompts with MFA for all logins.</li>
<li><code>confidence-score</code> policy prompts with MFA only for low confidence logins.</li>
</ul>

<b>Note</b>: The <code>confidence-score</code> policy is part of the <a href="https://auth0.com/docs/secure/multi-factor-authentication/adaptive-mfa">Adaptive MFA feature</a>. Adaptive MFA requires an add-on for the Enterprise plan; review <a href="https://auth0.com/pricing">Auth0 Pricing</a> for more details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.policies.set(request: ["all-applications"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Auth0::Types::MfaPolicyEnum]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Policies::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Guardian Factors Phone
<details><summary><code>client.guardian.factors.phone.<a href="/lib/auth0/guardian/factors/phone/client.rb">get_message_types</a>() -> Auth0::Types::GetGuardianFactorPhoneMessageTypesResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve list of <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-sms-voice-notifications-mfa">phone-type MFA factors</a> (i.e., sms and voice) that are enabled for your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.phone.get_message_types
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Phone::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.phone.<a href="/lib/auth0/guardian/factors/phone/client.rb">set_message_types</a>(request) -> Auth0::Types::SetGuardianFactorPhoneMessageTypesResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replace the list of <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-sms-voice-notifications-mfa">phone-type MFA factors</a> (i.e., sms and voice) that are enabled for your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.phone.set_message_types(message_types: ["sms"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**message_types:** `Internal::Types::Array[Auth0::Types::GuardianFactorPhoneFactorMessageTypeEnum]` — The list of phone factors to enable on the tenant. Can include `sms` and `voice`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Phone::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.phone.<a href="/lib/auth0/guardian/factors/phone/client.rb">get_twilio_provider</a>() -> Auth0::Types::GetGuardianFactorsProviderPhoneTwilioResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve configuration details for a Twilio phone provider that has been set up in your tenant. To learn more, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-sms-voice-notifications-mfa">Configure SMS and Voice Notifications for MFA</a>. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.phone.get_twilio_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Phone::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.phone.<a href="/lib/auth0/guardian/factors/phone/client.rb">set_twilio_provider</a>(request) -> Auth0::Types::SetGuardianFactorsProviderPhoneTwilioResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the configuration of a Twilio phone provider that has been set up in your tenant. To learn more, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-sms-voice-notifications-mfa">Configure SMS and Voice Notifications for MFA</a>. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.phone.set_twilio_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — From number
    
</dd>
</dl>

<dl>
<dd>

**messaging_service_sid:** `String` — Copilot SID
    
</dd>
</dl>

<dl>
<dd>

**auth_token:** `String` — Twilio Authentication token
    
</dd>
</dl>

<dl>
<dd>

**sid:** `String` — Twilio SID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Phone::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.phone.<a href="/lib/auth0/guardian/factors/phone/client.rb">get_selected_provider</a>() -> Auth0::Types::GetGuardianFactorsProviderPhoneResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the multi-factor authentication phone provider configured for your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.phone.get_selected_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Phone::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.phone.<a href="/lib/auth0/guardian/factors/phone/client.rb">set_provider</a>(request) -> Auth0::Types::SetGuardianFactorsProviderPhoneResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.phone.set_provider(provider: "auth0")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**provider:** `Auth0::Types::GuardianFactorsProviderSmsProviderEnum` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Phone::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.phone.<a href="/lib/auth0/guardian/factors/phone/client.rb">get_templates</a>() -> Auth0::Types::GetGuardianFactorPhoneTemplatesResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the multi-factor authentication enrollment and verification templates for phone-type factors available in your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.phone.get_templates
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Phone::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.phone.<a href="/lib/auth0/guardian/factors/phone/client.rb">set_templates</a>(request) -> Auth0::Types::SetGuardianFactorPhoneTemplatesResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Customize the messages sent to complete phone enrollment and verification (subscription required).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.phone.set_templates(
  enrollment_message: "enrollment_message",
  verification_message: "verification_message"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**enrollment_message:** `String` — Message sent to the user when they are invited to enroll with a phone number.
    
</dd>
</dl>

<dl>
<dd>

**verification_message:** `String` — Message sent to the user when they are prompted to verify their account.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Phone::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Guardian Factors PushNotification
<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">get_apns_provider</a>() -> Auth0::Types::GetGuardianFactorsProviderApnsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve configuration details for the multi-factor authentication APNS provider associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.get_apns_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">set_apns_provider</a>(request) -> Auth0::Types::SetGuardianFactorsProviderPushNotificationApnsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Overwrite all configuration details of the multi-factor authentication APNS provider associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.set_apns_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sandbox:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**bundle_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**p12:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">update_apns_provider</a>(request) -> Auth0::Types::UpdateGuardianFactorsProviderPushNotificationApnsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify configuration details of the multi-factor authentication APNS provider associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.update_apns_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sandbox:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**bundle_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**p12:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">set_fcm_provider</a>(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Overwrite all configuration details of the multi-factor authentication FCM provider associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.set_fcm_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**server_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">update_fcm_provider</a>(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify configuration details of the multi-factor authentication FCM provider associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.update_fcm_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**server_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">set_fcmv1provider</a>(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Overwrite all configuration details of the multi-factor authentication FCMV1 provider associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.set_fcmv1provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**server_credentials:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">update_fcmv1provider</a>(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify configuration details of the multi-factor authentication FCMV1 provider associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.update_fcmv1provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**server_credentials:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">get_sns_provider</a>() -> Auth0::Types::GetGuardianFactorsProviderSnsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve configuration details for an AWS SNS push notification provider that has been enabled for MFA. To learn more, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-push-notifications-for-mfa">Configure Push Notifications for MFA</a>. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.get_sns_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">set_sns_provider</a>(request) -> Auth0::Types::SetGuardianFactorsProviderPushNotificationSnsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Configure the <a href="https://auth0.com/docs/multifactor-authentication/developer/sns-configuration">AWS SNS push notification provider configuration</a> (subscription required).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.set_sns_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**aws_access_key_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**aws_secret_access_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**aws_region:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sns_apns_platform_application_arn:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sns_gcm_platform_application_arn:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">update_sns_provider</a>(request) -> Auth0::Types::UpdateGuardianFactorsProviderPushNotificationSnsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Configure the <a href="https://auth0.com/docs/multifactor-authentication/developer/sns-configuration">AWS SNS push notification provider configuration</a> (subscription required).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.update_sns_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**aws_access_key_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**aws_secret_access_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**aws_region:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sns_apns_platform_application_arn:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sns_gcm_platform_application_arn:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">get_selected_provider</a>() -> Auth0::Types::GetGuardianFactorsProviderPushNotificationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify the push notification provider configured for your tenant. For more information, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-push-notifications-for-mfa">Configure Push Notifications for MFA</a>. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.get_selected_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.push_notification.<a href="/lib/auth0/guardian/factors/push_notification/client.rb">set_provider</a>(request) -> Auth0::Types::SetGuardianFactorsProviderPushNotificationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify the push notification provider configured for your tenant. For more information, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors/configure-push-notifications-for-mfa">Configure Push Notifications for MFA</a>. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.push_notification.set_provider(provider: "guardian")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**provider:** `Auth0::Types::GuardianFactorsProviderPushNotificationProviderDataEnum` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::PushNotification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Guardian Factors Sms
<details><summary><code>client.guardian.factors.sms.<a href="/lib/auth0/guardian/factors/sms/client.rb">get_twilio_provider</a>() -> Auth0::Types::GetGuardianFactorsProviderSmsTwilioResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the <a href="https://auth0.com/docs/multifactor-authentication/twilio-configuration">Twilio SMS provider configuration</a> (subscription required).

    A new endpoint is available to retrieve the Twilio configuration related to phone factors (<a href='https://auth0.com/docs/api/management/v2/#!/Guardian/get_twilio'>phone Twilio configuration</a>). It has the same payload as this one. Please use it instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.sms.get_twilio_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Sms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.sms.<a href="/lib/auth0/guardian/factors/sms/client.rb">set_twilio_provider</a>(request) -> Auth0::Types::SetGuardianFactorsProviderSmsTwilioResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint has been deprecated. To complete this action, use the <a href="https://auth0.com/docs/api/management/v2/guardian/put-twilio">Update Twilio phone configuration</a> endpoint.

    <b>Previous functionality</b>: Update the Twilio SMS provider configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.sms.set_twilio_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — From number
    
</dd>
</dl>

<dl>
<dd>

**messaging_service_sid:** `String` — Copilot SID
    
</dd>
</dl>

<dl>
<dd>

**auth_token:** `String` — Twilio Authentication token
    
</dd>
</dl>

<dl>
<dd>

**sid:** `String` — Twilio SID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Sms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.sms.<a href="/lib/auth0/guardian/factors/sms/client.rb">get_selected_provider</a>() -> Auth0::Types::GetGuardianFactorsProviderSmsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint has been deprecated. To complete this action, use the <a href="https://auth0.com/docs/api/management/v2/guardian/get-phone-providers">Retrieve phone configuration</a> endpoint instead.

    <b>Previous functionality</b>: Retrieve details for the multi-factor authentication SMS provider configured for your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.sms.get_selected_provider
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Sms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.sms.<a href="/lib/auth0/guardian/factors/sms/client.rb">set_provider</a>(request) -> Auth0::Types::SetGuardianFactorsProviderSmsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint has been deprecated. To complete this action, use the <a href="https://auth0.com/docs/api/management/v2/guardian/put-phone-providers">Update phone configuration</a> endpoint instead.

    <b>Previous functionality</b>: Update the multi-factor authentication SMS provider configuration in your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.sms.set_provider(provider: "auth0")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**provider:** `Auth0::Types::GuardianFactorsProviderSmsProviderEnum` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Sms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.sms.<a href="/lib/auth0/guardian/factors/sms/client.rb">get_templates</a>() -> Auth0::Types::GetGuardianFactorSmsTemplatesResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint has been deprecated. To complete this action, use the <a href="https://auth0.com/docs/api/management/v2/guardian/get-factor-phone-templates">Retrieve enrollment and verification phone templates</a> endpoint instead.

    <b>Previous function</b>: Retrieve details of SMS enrollment and verification templates configured for your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.sms.get_templates
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Sms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.sms.<a href="/lib/auth0/guardian/factors/sms/client.rb">set_templates</a>(request) -> Auth0::Types::SetGuardianFactorSmsTemplatesResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint has been deprecated. To complete this action, use the <a href="https://auth0.com/docs/api/management/v2/guardian/put-factor-phone-templates">Update enrollment and verification phone templates</a> endpoint instead.

    <b>Previous functionality</b>: Customize the messages sent to complete SMS enrollment and verification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.sms.set_templates(
  enrollment_message: "enrollment_message",
  verification_message: "verification_message"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**enrollment_message:** `String` — Message sent to the user when they are invited to enroll with a phone number.
    
</dd>
</dl>

<dl>
<dd>

**verification_message:** `String` — Message sent to the user when they are prompted to verify their account.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Sms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Guardian Factors Duo Settings
<details><summary><code>client.guardian.factors.duo.settings.<a href="/lib/auth0/guardian/factors/duo/settings/client.rb">get</a>() -> Auth0::Types::GetGuardianFactorDuoSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the DUO account and factor configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.duo.settings.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Duo::Settings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.duo.settings.<a href="/lib/auth0/guardian/factors/duo/settings/client.rb">set</a>(request) -> Auth0::Types::SetGuardianFactorDuoSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Set the DUO account configuration and other properties specific to this factor.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.duo.settings.set
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ikey:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**skey:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**host:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Duo::Settings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guardian.factors.duo.settings.<a href="/lib/auth0/guardian/factors/duo/settings/client.rb">update</a>(request) -> Auth0::Types::UpdateGuardianFactorDuoSettingsResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guardian.factors.duo.settings.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ikey:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**skey:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**host:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Guardian::Factors::Duo::Settings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Hooks Secrets
<details><summary><code>client.hooks.secrets.<a href="/lib/auth0/hooks/secrets/client.rb">get</a>(id) -> Internal::Types::Hash[String, String]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a hook's secrets by the ID of the hook. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.secrets.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the hook to retrieve secrets from.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::Secrets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.hooks.secrets.<a href="/lib/auth0/hooks/secrets/client.rb">create</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add one or more secrets to an existing hook. Accepts an object of key-value pairs, where the key is the name of the secret. A hook can have a maximum of 20 secrets. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.secrets.create(
  id: "id",
  request: {
    key: "value"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the hook to retrieve
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::Secrets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.hooks.secrets.<a href="/lib/auth0/hooks/secrets/client.rb">delete</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete one or more existing secrets for a given hook. Accepts an array of secret names to delete. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.secrets.delete(
  id: "id",
  request: ["string"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the hook whose secrets to delete.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[String]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::Secrets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.hooks.secrets.<a href="/lib/auth0/hooks/secrets/client.rb">update</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update one or more existing secrets for an existing hook. Accepts an object of key-value pairs, where the key is the name of the existing secret. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hooks.secrets.update(
  id: "id",
  request: {
    key: "value"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the hook whose secrets to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Hooks::Secrets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Jobs UsersExports
<details><summary><code>client.jobs.users_exports.<a href="/lib/auth0/jobs/users_exports/client.rb">create</a>(request) -> Auth0::Types::CreateExportUsersResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Export all users to a file via a long-running job.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.jobs.users_exports.create
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**connection_id:** `String` — connection_id of the connection from which users will be exported.
    
</dd>
</dl>

<dl>
<dd>

**format:** `Auth0::Types::JobFileFormatEnum` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the number of records.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `Internal::Types::Array[Auth0::Types::CreateExportUsersFields]` — List of fields to be included in the CSV. Defaults to a predefined set of fields.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Jobs::UsersExports::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Jobs UsersImports
<details><summary><code>client.jobs.users_imports.<a href="/lib/auth0/jobs/users_imports/client.rb">create</a>(request) -> Auth0::Types::CreateImportUsersResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Import users from a <a href="https://auth0.com/docs/users/references/bulk-import-database-schema-examples">formatted file</a> into a connection via a long-running job. When importing users, with or without upsert, the `email_verified` is set to `false` when the email address is added or updated. Users must verify their email address. To avoid this behavior, set `email_verified` to `true` in the imported data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.jobs.users_imports.create
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Jobs::UsersImports::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Jobs VerificationEmail
<details><summary><code>client.jobs.verification_email.<a href="/lib/auth0/jobs/verification_email/client.rb">create</a>(request) -> Auth0::Types::CreateVerificationEmailResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send an email to the specified user that asks them to click a link to <a href="https://auth0.com/docs/email/custom#verification-email">verify their email address</a>.

Note: You must have the `Status` toggle enabled for the verification email template for the email to be sent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.jobs.verification_email.create(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — user_id of the user to send the verification email to.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — client_id of the client (application). If no value provided, the global Client ID will be used.
    
</dd>
</dl>

<dl>
<dd>

**identity:** `Auth0::Types::Identity` 
    
</dd>
</dl>

<dl>
<dd>

**organization_id:** `String` — (Optional) Organization ID – the ID of the Organization. If provided, organization parameters will be made available to the email template and organization branding will be applied to the prompt. In addition, the redirect link in the prompt will include organization_id and organization_name query string parameters.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Jobs::VerificationEmail::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Jobs Errors
<details><summary><code>client.jobs.errors.<a href="/lib/auth0/jobs/errors/client.rb">get</a>(id) -> Auth0::Jobs::Errors::Types::ErrorsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve error details of a failed job.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.jobs.errors.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the job.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Jobs::Errors::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Keys CustomSigning
<details><summary><code>client.keys.custom_signing.<a href="/lib/auth0/keys/custom_signing/client.rb">get</a>() -> Auth0::Types::GetCustomSigningKeysResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get entire jwks representation of custom signing keys.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.custom_signing.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Keys::CustomSigning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.custom_signing.<a href="/lib/auth0/keys/custom_signing/client.rb">set</a>(request) -> Auth0::Types::SetCustomSigningKeysResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create or replace entire jwks representation of custom signing keys.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.custom_signing.set(keys: [{
  kty: "EC"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**keys:** `Internal::Types::Array[Auth0::Types::CustomSigningKeyJwk]` — An array of custom public signing keys.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::CustomSigning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.custom_signing.<a href="/lib/auth0/keys/custom_signing/client.rb">delete</a>() -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete entire jwks representation of custom signing keys.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.custom_signing.delete
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Keys::CustomSigning::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Keys Encryption
<details><summary><code>client.keys.encryption.<a href="/lib/auth0/keys/encryption/client.rb">list</a>() -> Auth0::Types::ListEncryptionKeyOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of all the encryption keys associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.encryption.list(
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Default value is 50, maximum value is 100.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::Encryption::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.encryption.<a href="/lib/auth0/keys/encryption/client.rb">create</a>(request) -> Auth0::Types::CreateEncryptionKeyResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create the new, pre-activated encryption key, without the key material.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.encryption.create(type: "customer-provided-root-key")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**type:** `Auth0::Types::CreateEncryptionKeyType` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::Encryption::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.encryption.<a href="/lib/auth0/keys/encryption/client.rb">rekey</a>() -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Perform rekeying operation on the key hierarchy.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.encryption.rekey
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Keys::Encryption::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.encryption.<a href="/lib/auth0/keys/encryption/client.rb">get</a>(kid) -> Auth0::Types::GetEncryptionKeyResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the encryption key with the given ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.encryption.get(kid: "kid")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**kid:** `String` — Encryption key ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::Encryption::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.encryption.<a href="/lib/auth0/keys/encryption/client.rb">import</a>(kid, request) -> Auth0::Types::ImportEncryptionKeyResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Import wrapped key material and activate encryption key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.encryption.import(
  kid: "kid",
  wrapped_key: "wrapped_key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**kid:** `String` — Encryption key ID
    
</dd>
</dl>

<dl>
<dd>

**wrapped_key:** `String` — Base64 encoded ciphertext of key material wrapped by public wrapping key.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::Encryption::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.encryption.<a href="/lib/auth0/keys/encryption/client.rb">delete</a>(kid) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete the custom provided encryption key with the given ID and move back to using native encryption key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.encryption.delete(kid: "kid")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**kid:** `String` — Encryption key ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::Encryption::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.encryption.<a href="/lib/auth0/keys/encryption/client.rb">create_public_wrapping_key</a>(kid) -> Auth0::Types::CreateEncryptionKeyPublicWrappingResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create the public wrapping key to wrap your own encryption key material.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.encryption.create_public_wrapping_key(kid: "kid")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**kid:** `String` — Encryption key ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::Encryption::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Keys Signing
<details><summary><code>client.keys.signing.<a href="/lib/auth0/keys/signing/client.rb">list</a>() -> Internal::Types::Array[Auth0::Types::SigningKeys]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of all the application signing keys associated with your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.signing.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Keys::Signing::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.signing.<a href="/lib/auth0/keys/signing/client.rb">rotate</a>() -> Auth0::Types::RotateSigningKeysResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Rotate the application signing key of your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.signing.rotate
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::Keys::Signing::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.signing.<a href="/lib/auth0/keys/signing/client.rb">get</a>(kid) -> Auth0::Types::GetSigningKeysResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of the application signing key with the given ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.signing.get(kid: "kid")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**kid:** `String` — Key id of the key to retrieve
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::Signing::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.keys.signing.<a href="/lib/auth0/keys/signing/client.rb">revoke</a>(kid) -> Auth0::Types::RevokedSigningKeysResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Revoke the application signing key with the given ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.keys.signing.revoke(kid: "kid")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**kid:** `String` — Key id of the key to revoke
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Keys::Signing::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Organizations ClientGrants
<details><summary><code>client.organizations.client_grants.<a href="/lib/auth0/organizations/client_grants/client.rb">list</a>(id) -> Auth0::Types::ListOrganizationClientGrantsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.client_grants.list(
  id: "id",
  audience: "audience",
  client_id: "client_id",
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**audience:** `String` — Optional filter on audience of the client grant.
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — Optional filter on client_id of the client grant.
    
</dd>
</dl>

<dl>
<dd>

**grant_ids:** `String` — Optional filter on the ID of the client grant. Must be URL encoded and may be specified multiple times (max 10).<br /><b>e.g.</b> <i>../client-grants?grant_ids=id1&grant_ids=id2</i>
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::ClientGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.client_grants.<a href="/lib/auth0/organizations/client_grants/client.rb">create</a>(id, request) -> Auth0::Types::AssociateOrganizationClientGrantResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.client_grants.create(
  id: "id",
  grant_id: "grant_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**grant_id:** `String` — A Client Grant ID to add to the organization.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::ClientGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.client_grants.<a href="/lib/auth0/organizations/client_grants/client.rb">delete</a>(id, grant_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.client_grants.delete(
  id: "id",
  grant_id: "grant_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**grant_id:** `String` — The Client Grant ID to remove from the organization
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::ClientGrants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Organizations Connections
<details><summary><code>client.organizations.connections.<a href="/lib/auth0/organizations/connections/client.rb">list</a>(id) -> Auth0::Types::ListOrganizationAllConnectionsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.connections.list(
  id: "id",
  page: 1,
  per_page: 1,
  include_totals: true,
  is_enabled: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**is_enabled:** `Internal::Types::Boolean` — Filter connections by enabled status.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.connections.<a href="/lib/auth0/organizations/connections/client.rb">create</a>(id, request) -> Auth0::Types::CreateOrganizationAllConnectionResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.connections.create(
  id: "id",
  connection_id: "connection_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**organization_connection_name:** `String` — Name of the connection in the scope of this organization.
    
</dd>
</dl>

<dl>
<dd>

**assign_membership_on_login:** `Internal::Types::Boolean` — When true, all users that log in with this connection will be automatically granted membership in the organization. When false, users must be granted membership in the organization before logging in with this connection.
    
</dd>
</dl>

<dl>
<dd>

**show_as_button:** `Internal::Types::Boolean` — Determines whether a connection should be displayed on this organization’s login prompt. Only applicable for enterprise connections. Default: true.
    
</dd>
</dl>

<dl>
<dd>

**is_signup_enabled:** `Internal::Types::Boolean` — Determines whether organization signup should be enabled for this organization connection. Only applicable for database connections. Default: false.
    
</dd>
</dl>

<dl>
<dd>

**organization_access_level:** `Auth0::Types::OrganizationAccessLevelEnum` 
    
</dd>
</dl>

<dl>
<dd>

**is_enabled:** `Internal::Types::Boolean` — Whether the connection is enabled for the organization.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — Connection identifier.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.connections.<a href="/lib/auth0/organizations/connections/client.rb">get</a>(id, connection_id) -> Auth0::Types::GetOrganizationAllConnectionResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.connections.get(
  id: "id",
  connection_id: "connection_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — Connection identifier.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.connections.<a href="/lib/auth0/organizations/connections/client.rb">delete</a>(id, connection_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.connections.delete(
  id: "id",
  connection_id: "connection_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — Connection identifier.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.connections.<a href="/lib/auth0/organizations/connections/client.rb">update</a>(id, connection_id, request) -> Auth0::Types::UpdateOrganizationAllConnectionResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.connections.update(
  id: "id",
  connection_id: "connection_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — Connection identifier.
    
</dd>
</dl>

<dl>
<dd>

**organization_connection_name:** `String` — Name of the connection in the scope of this organization.
    
</dd>
</dl>

<dl>
<dd>

**assign_membership_on_login:** `Internal::Types::Boolean` — When true, all users that log in with this connection will be automatically granted membership in the organization. When false, users must be granted membership in the organization before logging in with this connection.
    
</dd>
</dl>

<dl>
<dd>

**show_as_button:** `Internal::Types::Boolean` — Determines whether a connection should be displayed on this organization’s login prompt. Only applicable for enterprise connections. Default: true.
    
</dd>
</dl>

<dl>
<dd>

**is_signup_enabled:** `Internal::Types::Boolean` — Determines whether organization signup should be enabled for this organization connection. Only applicable for database connections. Default: false.
    
</dd>
</dl>

<dl>
<dd>

**organization_access_level:** `Auth0::Types::OrganizationAccessLevelEnumWithNull` 
    
</dd>
</dl>

<dl>
<dd>

**is_enabled:** `Internal::Types::Boolean` — Whether the connection is enabled for the organization.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Connections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Organizations DiscoveryDomains
<details><summary><code>client.organizations.discovery_domains.<a href="/lib/auth0/organizations/discovery_domains/client.rb">list</a>(id) -> Auth0::Types::ListOrganizationDiscoveryDomainsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve list of all organization discovery domains associated with the specified organization.
This endpoint is subject to eventual consistency; newly created, updated, or deleted discovery domains may not immediately appear in the response.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.discovery_domains.list(
  id: "id",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the organization.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::DiscoveryDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.discovery_domains.<a href="/lib/auth0/organizations/discovery_domains/client.rb">create</a>(id, request) -> Auth0::Types::CreateOrganizationDiscoveryDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new discovery domain for an organization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.discovery_domains.create(
  id: "id",
  domain: "domain"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the organization.
    
</dd>
</dl>

<dl>
<dd>

**domain:** `String` — The domain name to associate with the organization e.g. acme.com.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Auth0::Types::OrganizationDiscoveryDomainStatus` 
    
</dd>
</dl>

<dl>
<dd>

**use_for_organization_discovery:** `Internal::Types::Boolean` — Indicates whether this domain should be used for organization discovery.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::DiscoveryDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.discovery_domains.<a href="/lib/auth0/organizations/discovery_domains/client.rb">get_by_name</a>(id, discovery_domain) -> Auth0::Types::GetOrganizationDiscoveryDomainByNameResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a single organization discovery domain specified by domain name.
This endpoint is subject to eventual consistency; newly created, updated, or deleted discovery domains may not immediately appear in the response.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.discovery_domains.get_by_name(
  id: "id",
  discovery_domain: "discovery_domain"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the organization.
    
</dd>
</dl>

<dl>
<dd>

**discovery_domain:** `String` — Domain name of the discovery domain.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::DiscoveryDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.discovery_domains.<a href="/lib/auth0/organizations/discovery_domains/client.rb">get</a>(id, discovery_domain_id) -> Auth0::Types::GetOrganizationDiscoveryDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a single organization discovery domain specified by ID.
This endpoint is subject to eventual consistency; newly created, updated, or deleted discovery domains may not immediately appear in the response.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.discovery_domains.get(
  id: "id",
  discovery_domain_id: "discovery_domain_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the organization.
    
</dd>
</dl>

<dl>
<dd>

**discovery_domain_id:** `String` — ID of the discovery domain.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::DiscoveryDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.discovery_domains.<a href="/lib/auth0/organizations/discovery_domains/client.rb">delete</a>(id, discovery_domain_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove a discovery domain from an organization. This action cannot be undone. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.discovery_domains.delete(
  id: "id",
  discovery_domain_id: "discovery_domain_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the organization.
    
</dd>
</dl>

<dl>
<dd>

**discovery_domain_id:** `String` — ID of the discovery domain.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::DiscoveryDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.discovery_domains.<a href="/lib/auth0/organizations/discovery_domains/client.rb">update</a>(id, discovery_domain_id, request) -> Auth0::Types::UpdateOrganizationDiscoveryDomainResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the verification status and/or use_for_organization_discovery for an organization discovery domain. The <code>status</code> field must be either <code>pending</code> or <code>verified</code>. The <code>use_for_organization_discovery</code> field can be <code>true</code> or <code>false</code> (default: <code>true</code>).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.discovery_domains.update(
  id: "id",
  discovery_domain_id: "discovery_domain_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the organization.
    
</dd>
</dl>

<dl>
<dd>

**discovery_domain_id:** `String` — ID of the discovery domain to update.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Auth0::Types::OrganizationDiscoveryDomainStatus` 
    
</dd>
</dl>

<dl>
<dd>

**use_for_organization_discovery:** `Internal::Types::Boolean` — Indicates whether this domain should be used for organization discovery.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::DiscoveryDomains::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Organizations EnabledConnections
<details><summary><code>client.organizations.enabled_connections.<a href="/lib/auth0/organizations/enabled_connections/client.rb">list</a>(id) -> Auth0::Types::ListOrganizationConnectionsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a specific connection currently enabled for an Organization. Information returned includes details such as connection ID, name, strategy, and whether the connection automatically grants membership upon login.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.enabled_connections.list(
  id: "id",
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::EnabledConnections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.enabled_connections.<a href="/lib/auth0/organizations/enabled_connections/client.rb">add</a>(id, request) -> Auth0::Types::AddOrganizationConnectionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Enable a specific connection for a given Organization. To enable a connection, it must already exist within your tenant; connections cannot be created through this action.

<a href="https://auth0.com/docs/authenticate/identity-providers">Connections</a> represent the relationship between Auth0 and a source of users. Available types of connections include database, enterprise, and social.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.enabled_connections.add(
  id: "id",
  connection_id: "connection_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — Single connection ID to add to the organization.
    
</dd>
</dl>

<dl>
<dd>

**assign_membership_on_login:** `Internal::Types::Boolean` — When true, all users that log in with this connection will be automatically granted membership in the organization. When false, users must be granted membership in the organization before logging in with this connection.
    
</dd>
</dl>

<dl>
<dd>

**is_signup_enabled:** `Internal::Types::Boolean` — Determines whether organization signup should be enabled for this organization connection. Only applicable for database connections. Default: false.
    
</dd>
</dl>

<dl>
<dd>

**show_as_button:** `Internal::Types::Boolean` — Determines whether a connection should be displayed on this organization’s login prompt. Only applicable for enterprise connections. Default: true.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::EnabledConnections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.enabled_connections.<a href="/lib/auth0/organizations/enabled_connections/client.rb">get</a>(id, connection_id) -> Auth0::Types::GetOrganizationConnectionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details about a specific connection currently enabled for an Organization. Information returned includes details such as connection ID, name, strategy, and whether the connection automatically grants membership upon login.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.enabled_connections.get(
  id: "id",
  connection_id: "connectionId"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — Connection identifier.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::EnabledConnections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.enabled_connections.<a href="/lib/auth0/organizations/enabled_connections/client.rb">delete</a>(id, connection_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Disable a specific connection for an Organization. Once disabled, Organization members can no longer use that connection to authenticate. 

<b>Note</b>: This action does not remove the connection from your tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.enabled_connections.delete(
  id: "id",
  connection_id: "connectionId"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — Connection identifier.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::EnabledConnections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.enabled_connections.<a href="/lib/auth0/organizations/enabled_connections/client.rb">update</a>(id, connection_id, request) -> Auth0::Types::UpdateOrganizationConnectionResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify the details of a specific connection currently enabled for an Organization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.enabled_connections.update(
  id: "id",
  connection_id: "connectionId"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — Connection identifier.
    
</dd>
</dl>

<dl>
<dd>

**assign_membership_on_login:** `Internal::Types::Boolean` — When true, all users that log in with this connection will be automatically granted membership in the organization. When false, users must be granted membership in the organization before logging in with this connection.
    
</dd>
</dl>

<dl>
<dd>

**is_signup_enabled:** `Internal::Types::Boolean` — Determines whether organization signup should be enabled for this organization connection. Only applicable for database connections. Default: false.
    
</dd>
</dl>

<dl>
<dd>

**show_as_button:** `Internal::Types::Boolean` — Determines whether a connection should be displayed on this organization’s login prompt. Only applicable for enterprise connections. Default: true.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::EnabledConnections::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Organizations Invitations
<details><summary><code>client.organizations.invitations.<a href="/lib/auth0/organizations/invitations/client.rb">list</a>(id) -> Auth0::Types::ListOrganizationInvitationsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a detailed list of invitations sent to users for a specific Organization. The list includes details such as inviter and invitee information, invitation URLs, and dates of creation and expiration. To learn more about Organization invitations, review <a href="https://auth0.com/docs/manage-users/organizations/configure-organizations/invite-members">Invite Organization Members</a>. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.invitations.list(
  id: "id",
  page: 1,
  per_page: 1,
  include_totals: true,
  fields: "fields",
  include_fields: true,
  sort: "sort"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — When true, return results inside an object that also contains the start and limit.  When false (default), a direct array of results is returned.  We do not yet support returning the total invitations count.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false). Defaults to true.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `String` — Field to sort by. Use field:order where order is 1 for ascending and -1 for descending Defaults to created_at:-1.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Invitations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.invitations.<a href="/lib/auth0/organizations/invitations/client.rb">create</a>(id, request) -> Auth0::Types::CreateOrganizationInvitationResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a user invitation for a specific Organization. Upon creation, the listed user receives an email inviting them to join the Organization. To learn more about Organization invitations, review <a href="https://auth0.com/docs/manage-users/organizations/configure-organizations/invite-members">Invite Organization Members</a>. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.invitations.create(
  id: "id",
  inviter: {
    name: "name"
  },
  invitee: {
    email: "email"
  },
  client_id: "client_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**inviter:** `Auth0::Types::OrganizationInvitationInviter` 
    
</dd>
</dl>

<dl>
<dd>

**invitee:** `Auth0::Types::OrganizationInvitationInvitee` 
    
</dd>
</dl>

<dl>
<dd>

**client_id:** `String` — Auth0 client ID. Used to resolve the application's login initiation endpoint.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — The id of the connection to force invitee to authenticate with.
    
</dd>
</dl>

<dl>
<dd>

**app_metadata:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**user_metadata:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**ttl_sec:** `Integer` — Number of seconds for which the invitation is valid before expiration. If unspecified or set to 0, this value defaults to 604800 seconds (7 days). Max value: 2592000 seconds (30 days).
    
</dd>
</dl>

<dl>
<dd>

**roles:** `Internal::Types::Array[String]` — List of roles IDs to associated with the user.
    
</dd>
</dl>

<dl>
<dd>

**send_invitation_email:** `Internal::Types::Boolean` — Whether the user will receive an invitation email (true) or no email (false), true by default
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Invitations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.invitations.<a href="/lib/auth0/organizations/invitations/client.rb">get</a>(id, invitation_id) -> Auth0::Types::GetOrganizationInvitationResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.invitations.get(
  id: "id",
  invitation_id: "invitation_id",
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**invitation_id:** `String` — The id of the user invitation.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false). Defaults to true.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Invitations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.invitations.<a href="/lib/auth0/organizations/invitations/client.rb">delete</a>(id, invitation_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.invitations.delete(
  id: "id",
  invitation_id: "invitation_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**invitation_id:** `String` — The id of the user invitation.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Invitations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Organizations Members
<details><summary><code>client.organizations.members.<a href="/lib/auth0/organizations/members/client.rb">list</a>(id) -> Auth0::Types::ListOrganizationMembersPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List organization members.
This endpoint is subject to eventual consistency. New users may not be immediately included in the response and deleted users may not be immediately removed from it.

<ul>
  <li>
    Use the <code>fields</code> parameter to optionally define the specific member details retrieved. If <code>fields</code> is left blank, all fields (except roles) are returned.
  </li>
  <li>
    Member roles are not sent by default. Use <code>fields=roles</code> to retrieve the roles assigned to each listed member. To use this parameter, you must include the <code>read:organization_member_roles</code> scope in the token.
  </li>
</ul>

This endpoint supports two types of pagination:

- Offset pagination
- Checkpoint pagination

Checkpoint pagination must be used if you need to retrieve more than 1000 organization members.

<h2>Checkpoint Pagination</h2>

To search by checkpoint, use the following parameters: - from: Optional id from which to start selection. - take: The total amount of entries to retrieve when using the from parameter. Defaults to 50. Note: The first time you call this endpoint using Checkpoint Pagination, you should omit the <code>from</code> parameter. If there are more results, a <code>next</code> value will be included in the response. You can use this for subsequent API calls. When <code>next</code> is no longer included in the response, this indicates there are no more pages remaining.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.members.list(
  id: "id",
  from: "from",
  take: 1,
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Members::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.members.<a href="/lib/auth0/organizations/members/client.rb">create</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Set one or more existing users as members of a specific <a href="https://auth0.com/docs/manage-users/organizations">Organization</a>.

To add a user to an Organization through this action, the user must already exist in your tenant. If a user does not yet exist, you can <a href="https://auth0.com/docs/manage-users/organizations/configure-organizations/invite-members">invite them to create an account</a>, manually create them through the Auth0 Dashboard, or use the Management API.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.members.create(
  id: "id",
  members: ["members"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**members:** `Internal::Types::Array[String]` — List of user IDs to add to the organization as members.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Members::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.members.<a href="/lib/auth0/organizations/members/client.rb">delete</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.members.delete(
  id: "id",
  members: ["members"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**members:** `Internal::Types::Array[String]` — List of user IDs to remove from the organization.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Members::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Organizations Members Roles
<details><summary><code>client.organizations.members.roles.<a href="/lib/auth0/organizations/members/roles/client.rb">list</a>(id, user_id) -> Auth0::Types::ListOrganizationMemberRolesOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed list of roles assigned to a given user within the context of a specific Organization. 

Users can be members of multiple Organizations with unique roles assigned for each membership. This action only returns the roles associated with the specified Organization; any roles assigned to the user within other Organizations are not included.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.members.roles.list(
  id: "id",
  user_id: "user_id",
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — ID of the user to associate roles with.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Members::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.members.roles.<a href="/lib/auth0/organizations/members/roles/client.rb">assign</a>(id, user_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assign one or more <a href="https://auth0.com/docs/manage-users/access-control/rbac">roles</a> to a user to determine their access for a specific Organization.

Users can be members of multiple Organizations with unique roles assigned for each membership. This action assigns roles to a user only for the specified Organization. Roles cannot be assigned to a user across multiple Organizations in the same call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.members.roles.assign(
  id: "id",
  user_id: "user_id",
  roles: ["roles"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — ID of the user to associate roles with.
    
</dd>
</dl>

<dl>
<dd>

**roles:** `Internal::Types::Array[String]` — List of roles IDs to associated with the user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Members::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organizations.members.roles.<a href="/lib/auth0/organizations/members/roles/client.rb">delete</a>(id, user_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove one or more Organization-specific <a href="https://auth0.com/docs/manage-users/access-control/rbac">roles</a> from a given user.

Users can be members of multiple Organizations with unique roles assigned for each membership. This action removes roles from a user in relation to the specified Organization. Roles assigned to the user within a different Organization cannot be managed in the same call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organizations.members.roles.delete(
  id: "id",
  user_id: "user_id",
  roles: ["roles"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Organization identifier.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — User ID of the organization member to remove roles from.
    
</dd>
</dl>

<dl>
<dd>

**roles:** `Internal::Types::Array[String]` — List of roles IDs associated with the organization member to remove.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Organizations::Members::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Prompts Rendering
<details><summary><code>client.prompts.rendering.<a href="/lib/auth0/prompts/rendering/client.rb">list</a>() -> Auth0::Types::ListAculsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get render setting configurations for all screens.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.rendering.list(
  fields: "fields",
  include_fields: true,
  page: 1,
  per_page: 1,
  include_totals: true,
  prompt: "prompt",
  screen: "screen",
  rendering_mode: "advanced"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (default: true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Maximum value is 100, default value is 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total configuration count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**prompt:** `String` — Name of the prompt to filter by
    
</dd>
</dl>

<dl>
<dd>

**screen:** `String` — Name of the screen to filter by
    
</dd>
</dl>

<dl>
<dd>

**rendering_mode:** `Auth0::Types::AculRenderingModeEnum` — Rendering mode to filter by
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::Rendering::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.prompts.rendering.<a href="/lib/auth0/prompts/rendering/client.rb">bulk_update</a>(request) -> Auth0::Types::BulkUpdateAculResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Learn more about <a href='https://auth0.com/docs/customize/login-pages/advanced-customizations/getting-started/configure-acul-screens'>configuring render settings</a> for advanced customization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.rendering.bulk_update(configs: [{
  prompt: "login",
  screen: "login"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**configs:** `Internal::Types::Array[Auth0::Types::AculConfigsItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::Rendering::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.prompts.rendering.<a href="/lib/auth0/prompts/rendering/client.rb">get</a>(prompt, screen) -> Auth0::Types::GetAculResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get render settings for a screen.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.rendering.get(
  prompt: "login",
  screen: "login"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**prompt:** `Auth0::Types::PromptGroupNameEnum` — Name of the prompt
    
</dd>
</dl>

<dl>
<dd>

**screen:** `Auth0::Types::ScreenGroupNameEnum` — Name of the screen
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::Rendering::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.prompts.rendering.<a href="/lib/auth0/prompts/rendering/client.rb">update</a>(prompt, screen, request) -> Auth0::Types::UpdateAculResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Learn more about <a href='https://auth0.com/docs/customize/login-pages/advanced-customizations/getting-started/configure-acul-screens'>configuring render settings</a> for advanced customization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.rendering.update(
  prompt: "login",
  screen: "login"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**prompt:** `Auth0::Types::PromptGroupNameEnum` — Name of the prompt
    
</dd>
</dl>

<dl>
<dd>

**screen:** `Auth0::Types::ScreenGroupNameEnum` — Name of the screen
    
</dd>
</dl>

<dl>
<dd>

**rendering_mode:** `Auth0::Types::AculRenderingModeEnum` — Rendering mode
    
</dd>
</dl>

<dl>
<dd>

**context_configuration:** `Internal::Types::Array[Auth0::Types::AculContextConfigurationItem]` 
    
</dd>
</dl>

<dl>
<dd>

**default_head_tags_disabled:** `Internal::Types::Boolean` — Override Universal Login default head tags
    
</dd>
</dl>

<dl>
<dd>

**use_page_template:** `Internal::Types::Boolean` — Use page template with ACUL
    
</dd>
</dl>

<dl>
<dd>

**head_tags:** `Internal::Types::Array[Auth0::Types::AculHeadTag]` — An array of head tags
    
</dd>
</dl>

<dl>
<dd>

**filters:** `Auth0::Types::AculFilters` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::Rendering::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Prompts CustomText
<details><summary><code>client.prompts.custom_text.<a href="/lib/auth0/prompts/custom_text/client.rb">get</a>(prompt, language) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve custom text for a specific prompt and language.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.custom_text.get(
  prompt: "login",
  language: "am"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**prompt:** `Auth0::Types::PromptGroupNameEnum` — Name of the prompt.
    
</dd>
</dl>

<dl>
<dd>

**language:** `Auth0::Types::PromptLanguageEnum` — Language to update.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::CustomText::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.prompts.custom_text.<a href="/lib/auth0/prompts/custom_text/client.rb">set</a>(prompt, language, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Set custom text for a specific prompt. Existing texts will be overwritten.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.custom_text.set(
  prompt: "login",
  language: "am",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**prompt:** `Auth0::Types::PromptGroupNameEnum` — Name of the prompt.
    
</dd>
</dl>

<dl>
<dd>

**language:** `Auth0::Types::PromptLanguageEnum` — Language to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::CustomText::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Prompts Partials
<details><summary><code>client.prompts.partials.<a href="/lib/auth0/prompts/partials/client.rb">get</a>(prompt) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get template partials for a prompt
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.partials.get(prompt: "login")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**prompt:** `Auth0::Types::PartialGroupsEnum` — Name of the prompt.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::Partials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.prompts.partials.<a href="/lib/auth0/prompts/partials/client.rb">set</a>(prompt, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Set template partials for a prompt
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.prompts.partials.set(
  prompt: "login",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**prompt:** `Auth0::Types::PartialGroupsEnum` — Name of the prompt.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Prompts::Partials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## RiskAssessments Settings
<details><summary><code>client.risk_assessments.settings.<a href="/lib/auth0/risk_assessments/settings/client.rb">get</a>() -> Auth0::Types::GetRiskAssessmentsSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets the tenant settings for risk assessments
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.risk_assessments.settings.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::RiskAssessments::Settings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.risk_assessments.settings.<a href="/lib/auth0/risk_assessments/settings/client.rb">update</a>(request) -> Auth0::Types::UpdateRiskAssessmentsSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the tenant settings for risk assessments
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.risk_assessments.settings.update(enabled: true)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` — Whether or not risk assessment is enabled.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::RiskAssessments::Settings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## RiskAssessments Settings NewDevice
<details><summary><code>client.risk_assessments.settings.new_device.<a href="/lib/auth0/risk_assessments/settings/new_device/client.rb">get</a>() -> Auth0::Types::GetRiskAssessmentsSettingsNewDeviceResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets the risk assessment settings for the new device assessor
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.risk_assessments.settings.new_device.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Auth0::RiskAssessments::Settings::NewDevice::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.risk_assessments.settings.new_device.<a href="/lib/auth0/risk_assessments/settings/new_device/client.rb">update</a>(request) -> Auth0::Types::UpdateRiskAssessmentsSettingsNewDeviceResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the risk assessment settings for the new device assessor
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.risk_assessments.settings.new_device.update(remember_for: 1)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**remember_for:** `Integer` — Length of time to remember devices for, in days.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::RiskAssessments::Settings::NewDevice::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Roles Permissions
<details><summary><code>client.roles.permissions.<a href="/lib/auth0/roles/permissions/client.rb">list</a>(id) -> Auth0::Types::ListRolePermissionsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed list (name, description, resource server) of permissions granted by a specified user role.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.permissions.list(
  id: "id",
  per_page: 1,
  page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the role to list granted permissions.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::Permissions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.roles.permissions.<a href="/lib/auth0/roles/permissions/client.rb">add</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add one or more <a href="https://auth0.com/docs/manage-users/access-control/configure-core-rbac/manage-permissions">permissions</a> to a specified user role.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.permissions.add(
  id: "id",
  permissions: [{
    resource_server_identifier: "resource_server_identifier",
    permission_name: "permission_name"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the role to add permissions to.
    
</dd>
</dl>

<dl>
<dd>

**permissions:** `Internal::Types::Array[Auth0::Types::PermissionRequestPayload]` — array of resource_server_identifier, permission_name pairs.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::Permissions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.roles.permissions.<a href="/lib/auth0/roles/permissions/client.rb">delete</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove one or more <a href="https://auth0.com/docs/manage-users/access-control/configure-core-rbac/manage-permissions">permissions</a> from a specified user role.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.permissions.delete(
  id: "id",
  permissions: [{
    resource_server_identifier: "resource_server_identifier",
    permission_name: "permission_name"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the role to remove permissions from.
    
</dd>
</dl>

<dl>
<dd>

**permissions:** `Internal::Types::Array[Auth0::Types::PermissionRequestPayload]` — array of resource_server_identifier, permission_name pairs.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::Permissions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Roles Users
<details><summary><code>client.roles.users.<a href="/lib/auth0/roles/users/client.rb">list</a>(id) -> Auth0::Types::ListRoleUsersPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve list of users associated with a specific role. For Dashboard instructions, review <a href="https://auth0.com/docs/manage-users/access-control/configure-core-rbac/roles/view-users-assigned-to-roles">View Users Assigned to Roles</a>.

This endpoint supports two types of pagination:
<ul>
<li>Offset pagination</li>
<li>Checkpoint pagination</li>
</ul>

Checkpoint pagination must be used if you need to retrieve more than 1000 organization members.

<h2>Checkpoint Pagination</h2>

To search by checkpoint, use the following parameters:
<ul>
<li><code>from</code>: Optional id from which to start selection.</li>
<li><code>take</code>: The total amount of entries to retrieve when using the from parameter. Defaults to 50.</li>
</ul>

<b>Note</b>: The first time you call this endpoint using checkpoint pagination, omit the <code>from</code> parameter. If there are more results, a <code>next</code> value is included in the response. You can use this for subsequent API calls. When <code>next</code> is no longer included in the response, no pages are remaining.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.users.list(
  id: "id",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the role to retrieve a list of users associated with.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.roles.users.<a href="/lib/auth0/roles/users/client.rb">assign</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assign one or more users to an existing user role. To learn more, review <a href="https://auth0.com/docs/manage-users/access-control/rbac">Role-Based Access Control</a>.

<b>Note</b>: New roles cannot be created through this action.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.roles.users.assign(
  id: "id",
  users: ["users"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the role to assign users to.
    
</dd>
</dl>

<dl>
<dd>

**users:** `Internal::Types::Array[String]` — user_id's of the users to assign the role to.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Roles::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SelfServiceProfiles CustomText
<details><summary><code>client.self_service_profiles.custom_text.<a href="/lib/auth0/self_service_profiles/custom_text/client.rb">list</a>(id, language, page) -> Internal::Types::Hash[String, String]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves text customizations for a given self-service profile, language and Self Service SSO Flow page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.custom_text.list(
  id: "id",
  language: "en",
  page: "get-started"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the self-service profile.
    
</dd>
</dl>

<dl>
<dd>

**language:** `Auth0::Types::SelfServiceProfileCustomTextLanguageEnum` — The language of the custom text.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Auth0::Types::SelfServiceProfileCustomTextPageEnum` — The page where the custom text is shown.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::CustomText::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.self_service_profiles.custom_text.<a href="/lib/auth0/self_service_profiles/custom_text/client.rb">set</a>(id, language, page, request) -> Internal::Types::Hash[String, String]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates text customizations for a given self-service profile, language and Self Service SSO Flow page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.custom_text.set(
  id: "id",
  language: "en",
  page: "get-started",
  request: {
    key: "value"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the self-service profile.
    
</dd>
</dl>

<dl>
<dd>

**language:** `Auth0::Types::SelfServiceProfileCustomTextLanguageEnum` — The language of the custom text.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Auth0::Types::SelfServiceProfileCustomTextPageEnum` — The page where the custom text is shown.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::CustomText::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SelfServiceProfiles SSOTicket
<details><summary><code>client.self_service_profiles.sso_ticket.<a href="/lib/auth0/self_service_profiles/sso_ticket/client.rb">create</a>(id, request) -> Auth0::Types::CreateSelfServiceProfileSSOTicketResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an SSO access ticket to initiate the Self Service SSO Flow using a self-service profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.sso_ticket.create(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id of the self-service profile to retrieve
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — If provided, this will allow editing of the provided connection during the SSO Flow
    
</dd>
</dl>

<dl>
<dd>

**connection_config:** `Auth0::Types::SelfServiceProfileSSOTicketConnectionConfig` 
    
</dd>
</dl>

<dl>
<dd>

**enabled_clients:** `Internal::Types::Array[String]` — List of client_ids that the connection will be enabled for.
    
</dd>
</dl>

<dl>
<dd>

**enabled_organizations:** `Internal::Types::Array[Auth0::Types::SelfServiceProfileSSOTicketEnabledOrganization]` — List of organizations that the connection will be enabled for.
    
</dd>
</dl>

<dl>
<dd>

**ttl_sec:** `Integer` — Number of seconds for which the ticket is valid before expiration. If unspecified or set to 0, this value defaults to 432000 seconds (5 days).
    
</dd>
</dl>

<dl>
<dd>

**domain_aliases_config:** `Auth0::Types::SelfServiceProfileSSOTicketDomainAliasesConfig` 
    
</dd>
</dl>

<dl>
<dd>

**provisioning_config:** `Auth0::Types::SelfServiceProfileSSOTicketProvisioningConfig` 
    
</dd>
</dl>

<dl>
<dd>

**use_for_organization_discovery:** `Internal::Types::Boolean` — Indicates whether a verified domain should be used for organization discovery during authentication.
    
</dd>
</dl>

<dl>
<dd>

**enabled_features:** `Auth0::Types::SelfServiceProfileSSOTicketEnabledFeatures` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::SSOTicket::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.self_service_profiles.sso_ticket.<a href="/lib/auth0/self_service_profiles/sso_ticket/client.rb">revoke</a>(profile_id, id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Revokes an SSO access ticket and invalidates associated sessions. The ticket will no longer be accepted to initiate a Self-Service SSO session. If any users have already started a session through this ticket, their session will be terminated. Clients should expect a `202 Accepted` response upon successful processing, indicating that the request has been acknowledged and that the revocation is underway but may not be fully completed at the time of response. If the specified ticket does not exist, a `202 Accepted` response is also returned, signaling that no further action is required.
Clients should treat these `202` responses as an acknowledgment that the request has been accepted and is in progress, even if the ticket was not found.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.self_service_profiles.sso_ticket.revoke(
  profile_id: "profileId",
  id: "id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**profile_id:** `String` — The id of the self-service profile
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The id of the ticket to revoke
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::SelfServiceProfiles::SSOTicket::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tenants Settings
<details><summary><code>client.tenants.settings.<a href="/lib/auth0/tenants/settings/client.rb">get</a>() -> Auth0::Types::GetTenantSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve tenant settings. A list of fields to include or exclude may also be specified.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tenants.settings.get(
  fields: "fields",
  include_fields: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**fields:** `String` — Comma-separated list of fields to include or exclude (based on value provided for include_fields) in the result. Leave empty to retrieve all fields.
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Tenants::Settings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tenants.settings.<a href="/lib/auth0/tenants/settings/client.rb">update</a>(request) -> Auth0::Types::UpdateTenantSettingsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update settings for a tenant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tenants.settings.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**change_password:** `Auth0::Types::TenantSettingsPasswordPage` 
    
</dd>
</dl>

<dl>
<dd>

**device_flow:** `Auth0::Types::TenantSettingsDeviceFlow` — Device Flow configuration.
    
</dd>
</dl>

<dl>
<dd>

**guardian_mfa_page:** `Auth0::Types::TenantSettingsGuardianPage` 
    
</dd>
</dl>

<dl>
<dd>

**default_audience:** `String` — Default audience for API Authorization.
    
</dd>
</dl>

<dl>
<dd>

**default_directory:** `String` — Name of connection used for password grants at the `/token` endpoint. The following connection types are supported: LDAP, AD, Database Connections, Passwordless, Windows Azure Active Directory, ADFS.
    
</dd>
</dl>

<dl>
<dd>

**error_page:** `Auth0::Types::TenantSettingsErrorPage` 
    
</dd>
</dl>

<dl>
<dd>

**default_token_quota:** `Auth0::Types::DefaultTokenQuota` 
    
</dd>
</dl>

<dl>
<dd>

**flags:** `Auth0::Types::TenantSettingsFlags` 
    
</dd>
</dl>

<dl>
<dd>

**friendly_name:** `String` — Friendly name for this tenant.
    
</dd>
</dl>

<dl>
<dd>

**picture_url:** `String` — URL of logo to be shown for this tenant (recommended size: 150x150)
    
</dd>
</dl>

<dl>
<dd>

**support_email:** `String` — End-user support email.
    
</dd>
</dl>

<dl>
<dd>

**support_url:** `String` — End-user support url.
    
</dd>
</dl>

<dl>
<dd>

**allowed_logout_urls:** `Internal::Types::Array[String]` — URLs that are valid to redirect to after logout from Auth0.
    
</dd>
</dl>

<dl>
<dd>

**session_lifetime:** `Integer` — Number of hours a session will stay valid.
    
</dd>
</dl>

<dl>
<dd>

**idle_session_lifetime:** `Integer` — Number of hours for which a session can be inactive before the user must log in again.
    
</dd>
</dl>

<dl>
<dd>

**ephemeral_session_lifetime:** `Integer` — Number of hours an ephemeral (non-persistent) session will stay valid.
    
</dd>
</dl>

<dl>
<dd>

**idle_ephemeral_session_lifetime:** `Integer` — Number of hours for which an ephemeral (non-persistent) session can be inactive before the user must log in again.
    
</dd>
</dl>

<dl>
<dd>

**sandbox_version:** `String` — Selected sandbox version for the extensibility environment
    
</dd>
</dl>

<dl>
<dd>

**legacy_sandbox_version:** `String` — Selected legacy sandbox version for the extensibility environment
    
</dd>
</dl>

<dl>
<dd>

**default_redirection_uri:** `String` — The default absolute redirection uri, must be https
    
</dd>
</dl>

<dl>
<dd>

**enabled_locales:** `Internal::Types::Array[Auth0::Types::TenantSettingsSupportedLocalesEnum]` — Supported locales for the user interface
    
</dd>
</dl>

<dl>
<dd>

**session_cookie:** `Auth0::Types::SessionCookieSchema` 
    
</dd>
</dl>

<dl>
<dd>

**sessions:** `Auth0::Types::TenantSettingsSessions` 
    
</dd>
</dl>

<dl>
<dd>

**oidc_logout:** `Auth0::Types::TenantOidcLogoutSettings` 
    
</dd>
</dl>

<dl>
<dd>

**customize_mfa_in_postlogin_action:** `Internal::Types::Boolean` — Whether to enable flexible factors for MFA in the PostLogin action
    
</dd>
</dl>

<dl>
<dd>

**allow_organization_name_in_authentication_api:** `Internal::Types::Boolean` — Whether to accept an organization name instead of an ID on auth endpoints
    
</dd>
</dl>

<dl>
<dd>

**acr_values_supported:** `Internal::Types::Array[String]` — Supported ACR values
    
</dd>
</dl>

<dl>
<dd>

**mtls:** `Auth0::Types::TenantSettingsMtls` 
    
</dd>
</dl>

<dl>
<dd>

**pushed_authorization_requests_supported:** `Internal::Types::Boolean` — Enables the use of Pushed Authorization Requests
    
</dd>
</dl>

<dl>
<dd>

**authorization_response_iss_parameter_supported:** `Internal::Types::Boolean` — Supports iss parameter in authorization responses
    
</dd>
</dl>

<dl>
<dd>

**skip_non_verifiable_callback_uri_confirmation_prompt:** `Internal::Types::Boolean` 

Controls whether a confirmation prompt is shown during login flows when the redirect URI uses non-verifiable callback URIs (for example, a custom URI schema such as `myapp://`, or `localhost`).
If set to true, a confirmation prompt will not be shown. We recommend that this is set to false for improved protection from malicious apps.
See https://auth0.com/docs/secure/security-guidance/measures-against-app-impersonation for more information.
    
</dd>
</dl>

<dl>
<dd>

**resource_parameter_profile:** `Auth0::Types::TenantSettingsResourceParameterProfile` 
    
</dd>
</dl>

<dl>
<dd>

**client_id_metadata_document_supported:** `Internal::Types::Boolean` — Whether the authorization server supports retrieving client metadata from a client_id URL.
    
</dd>
</dl>

<dl>
<dd>

**enable_ai_guide:** `Internal::Types::Boolean` — Whether Auth0 Guide (AI-powered assistance) is enabled for this tenant.
    
</dd>
</dl>

<dl>
<dd>

**phone_consolidated_experience:** `Internal::Types::Boolean` — Whether Phone Consolidated Experience is enabled for this tenant.
    
</dd>
</dl>

<dl>
<dd>

**dynamic_client_registration_security_mode:** `Auth0::Types::TenantSettingsDynamicClientRegistrationSecurityMode` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Tenants::Settings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users AuthenticationMethods
<details><summary><code>client.users.authentication_methods.<a href="/lib/auth0/users/authentication_methods/client.rb">list</a>(id) -> Auth0::Types::ListUserAuthenticationMethodsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed list of authentication methods associated with a specified user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.authentication_methods.list(
  id: "id",
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the user in question.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0. Default is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Default is 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::AuthenticationMethods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.authentication_methods.<a href="/lib/auth0/users/authentication_methods/client.rb">create</a>(id, request) -> Auth0::Types::CreateUserAuthenticationMethodResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an authentication method. Authentication methods created via this endpoint will be auto confirmed and should already have verification completed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.authentication_methods.create(
  id: "id",
  type: "phone"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the user to whom the new authentication method will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Auth0::Types::CreatedUserAuthenticationMethodTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — A human-readable label to identify the authentication method.
    
</dd>
</dl>

<dl>
<dd>

**totp_secret:** `String` — Base32 encoded secret for TOTP generation.
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — Applies to phone authentication methods only. The destination phone number used to send verification codes via text and voice.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — Applies to email authentication methods only. The email address used to send verification messages.
    
</dd>
</dl>

<dl>
<dd>

**preferred_authentication_method:** `Auth0::Types::PreferredAuthenticationMethodEnum` 
    
</dd>
</dl>

<dl>
<dd>

**key_id:** `String` — Applies to webauthn authentication methods only. The id of the credential.
    
</dd>
</dl>

<dl>
<dd>

**public_key:** `String` — Applies to webauthn authentication methods only. The public key, which is encoded as base64.
    
</dd>
</dl>

<dl>
<dd>

**relying_party_identifier:** `String` — Applies to webauthn authentication methods only. The relying party identifier.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::AuthenticationMethods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.authentication_methods.<a href="/lib/auth0/users/authentication_methods/client.rb">set</a>(id, request) -> Internal::Types::Array[Auth0::Types::SetUserAuthenticationMethodResponseContent]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replace the specified user <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors"> authentication methods</a> with supplied values.

    <b>Note</b>: Authentication methods supplied through this action do not iterate on existing methods. Instead, any methods passed will overwrite the user&#8217s existing settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.authentication_methods.set(
  id: "id",
  request: [{
    type: "phone"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the user in question.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Auth0::Types::SetUserAuthenticationMethods]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::AuthenticationMethods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.authentication_methods.<a href="/lib/auth0/users/authentication_methods/client.rb">delete_all</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove all authentication methods (i.e., enrolled MFA factors) from the specified user account. This action cannot be undone. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.authentication_methods.delete_all(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the user in question.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::AuthenticationMethods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.authentication_methods.<a href="/lib/auth0/users/authentication_methods/client.rb">get</a>(id, authentication_method_id) -> Auth0::Types::GetUserAuthenticationMethodResponseContent</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.authentication_methods.get(
  id: "id",
  authentication_method_id: "authentication_method_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the user in question.
    
</dd>
</dl>

<dl>
<dd>

**authentication_method_id:** `String` — The ID of the authentication methods in question.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::AuthenticationMethods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.authentication_methods.<a href="/lib/auth0/users/authentication_methods/client.rb">delete</a>(id, authentication_method_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove the authentication method with the given ID from the specified user. For more information, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/manage-mfa-auth0-apis/manage-authentication-methods-with-management-api">Manage Authentication Methods with Management API</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.authentication_methods.delete(
  id: "id",
  authentication_method_id: "authentication_method_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the user in question.
    
</dd>
</dl>

<dl>
<dd>

**authentication_method_id:** `String` — The ID of the authentication method to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::AuthenticationMethods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.authentication_methods.<a href="/lib/auth0/users/authentication_methods/client.rb">update</a>(id, authentication_method_id, request) -> Auth0::Types::UpdateUserAuthenticationMethodResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify the authentication method with the given ID from the specified user. For more information, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/manage-mfa-auth0-apis/manage-authentication-methods-with-management-api">Manage Authentication Methods with Management API</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.authentication_methods.update(
  id: "id",
  authentication_method_id: "authentication_method_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the user in question.
    
</dd>
</dl>

<dl>
<dd>

**authentication_method_id:** `String` — The ID of the authentication method to update.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — A human-readable label to identify the authentication method.
    
</dd>
</dl>

<dl>
<dd>

**preferred_authentication_method:** `Auth0::Types::PreferredAuthenticationMethodEnum` — Preferred phone authentication method
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::AuthenticationMethods::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Authenticators
<details><summary><code>client.users.authenticators.<a href="/lib/auth0/users/authenticators/client.rb">delete_all</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove all authenticators registered to a given user ID, such as OTP, email, phone, and push-notification. This action cannot be undone. For more information, review <a href="https://auth0.com/docs/secure/multi-factor-authentication/manage-mfa-auth0-apis/manage-authentication-methods-with-management-api">Manage Authentication Methods with Management API</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.authenticators.delete_all(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Authenticators::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users ConnectedAccounts
<details><summary><code>client.users.connected_accounts.<a href="/lib/auth0/users/connected_accounts/client.rb">list</a>(id) -> Auth0::Types::ListUserConnectedAccountsResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all connected accounts associated with the user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.connected_accounts.list(
  id: "id",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to list connected accounts for.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results to return.  Defaults to 10 with a maximum of 20
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::ConnectedAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Enrollments
<details><summary><code>client.users.enrollments.<a href="/lib/auth0/users/enrollments/client.rb">get</a>(id) -> Internal::Types::Array[Auth0::Types::UsersEnrollment]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the first <a href="https://auth0.com/docs/secure/multi-factor-authentication/multi-factor-authentication-factors">multi-factor authentication</a> enrollment that a specific user has confirmed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.enrollments.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to list enrollments for.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Enrollments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users FederatedConnectionsTokensets
<details><summary><code>client.users.federated_connections_tokensets.<a href="/lib/auth0/users/federated_connections_tokensets/client.rb">list</a>(id) -> Internal::Types::Array[Auth0::Types::FederatedConnectionTokenSet]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List active federated connections tokensets for a provided user
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.federated_connections_tokensets.list(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — User identifier
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::FederatedConnectionsTokensets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.federated_connections_tokensets.<a href="/lib/auth0/users/federated_connections_tokensets/client.rb">delete</a>(id, tokenset_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.federated_connections_tokensets.delete(
  id: "id",
  tokenset_id: "tokenset_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Id of the user that owns the tokenset
    
</dd>
</dl>

<dl>
<dd>

**tokenset_id:** `String` — The tokenset id
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::FederatedConnectionsTokensets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Groups
<details><summary><code>client.users.groups.<a href="/lib/auth0/users/groups/client.rb">get</a>(id) -> Auth0::Types::GetUserGroupsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all groups to which this user belongs.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.groups.get(
  id: "id",
  fields: "fields",
  include_fields: true,
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to list groups for.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String` — A comma separated list of fields to include or exclude (depending on include_fields) from the result, empty to retrieve all fields
    
</dd>
</dl>

<dl>
<dd>

**include_fields:** `Internal::Types::Boolean` — Whether specified fields are to be included (true) or excluded (false).
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Groups::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Identities
<details><summary><code>client.users.identities.<a href="/lib/auth0/users/identities/client.rb">link</a>(id, request) -> Internal::Types::Array[Auth0::Types::UserIdentity]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Link two user accounts together forming a primary and secondary relationship. On successful linking, the endpoint returns the new array of the primary account identities.

Note: There are two ways of invoking the endpoint:

<ul>
  <li>With the authenticated primary account's JWT in the Authorization header, which has the <code>update:current_user_identities</code> scope:
    <pre>
      POST /api/v2/users/PRIMARY_ACCOUNT_USER_ID/identities
      Authorization: "Bearer PRIMARY_ACCOUNT_JWT"
      {
        "link_with": "SECONDARY_ACCOUNT_JWT"
      }
    </pre>
    In this case, only the <code>link_with</code> param is required in the body, which also contains the JWT obtained upon the secondary account's authentication.
  </li>
  <li>With a token generated by the API V2 containing the <code>update:users</code> scope:
    <pre>
    POST /api/v2/users/PRIMARY_ACCOUNT_USER_ID/identities
    Authorization: "Bearer YOUR_API_V2_TOKEN"
    {
      "provider": "SECONDARY_ACCOUNT_PROVIDER",
      "connection_id": "SECONDARY_ACCOUNT_CONNECTION_ID(OPTIONAL)",
      "user_id": "SECONDARY_ACCOUNT_USER_ID"
    }
    </pre>
    In this case you need to send <code>provider</code> and <code>user_id</code> in the body. Optionally you can also send the <code>connection_id</code> param which is suitable for identifying a particular database connection for the 'auth0' provider.
  </li>
</ul>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.identities.link(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the primary user account to link a second user account to.
    
</dd>
</dl>

<dl>
<dd>

**provider:** `Auth0::Types::UserIdentityProviderEnum` — Identity provider of the secondary user account being linked.
    
</dd>
</dl>

<dl>
<dd>

**connection_id:** `String` — connection_id of the secondary user account being linked when more than one `auth0` database provider exists.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `Auth0::Types::UserID` 
    
</dd>
</dl>

<dl>
<dd>

**link_with:** `String` — JWT for the secondary account being linked. If sending this parameter, `provider`, `user_id`, and `connection_id` must not be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Identities::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.identities.<a href="/lib/auth0/users/identities/client.rb">delete</a>(id, provider, user_id) -> Internal::Types::Array[Auth0::Types::DeleteUserIdentityResponseContentItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unlink a specific secondary account from a target user. This action requires the ID of both the target user and the secondary account. 

Unlinking the secondary account removes it from the identities array of the target user and creates a new standalone profile for the secondary account. To learn more, review <a href="https://auth0.com/docs/manage-users/user-accounts/user-account-linking/unlink-user-accounts">Unlink User Accounts</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.identities.delete(
  id: "id",
  provider: "ad",
  user_id: "user_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the primary user account.
    
</dd>
</dl>

<dl>
<dd>

**provider:** `Auth0::Types::UserIdentityProviderEnum` — Identity provider name of the secondary linked account (e.g. `google-oauth2`).
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — ID of the secondary linked account (e.g. `123456789081523216417` part after the `|` in `google-oauth2|123456789081523216417`).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Identities::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Logs
<details><summary><code>client.users.logs.<a href="/lib/auth0/users/logs/client.rb">list</a>(id) -> Auth0::Types::UserListLogOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve log events for a specific user.

Note: For more information on all possible event types, their respective acronyms and descriptions, see <a href="https://auth0.com/docs/logs/log-event-type-codes">Log Event Type Codes</a>.

For more information on the list of fields that can be used in `sort`, see <a href="https://auth0.com/docs/logs/log-search-query-syntax#searchable-fields">Searchable Fields</a>.

Auth0 <a href="https://auth0.com/docs/logs/retrieve-log-events-using-mgmt-api#limitations">limits the number of logs</a> you can return by search criteria to 100 logs per request. Furthermore, you may only paginate through up to 1,000 search results. If you exceed this threshold, please redefine your search.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.logs.list(
  id: "id",
  page: 1,
  per_page: 1,
  sort: "sort",
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user of the logs to retrieve
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Paging is disabled if parameter not sent.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `String` — Field to sort by. Use `fieldname:1` for ascending order and `fieldname:-1` for descending.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Logs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Multifactor
<details><summary><code>client.users.multifactor.<a href="/lib/auth0/users/multifactor/client.rb">invalidate_remember_browser</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Invalidate all remembered browsers across all <a href="https://auth0.com/docs/multifactor-authentication">authentication factors</a> for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.multifactor.invalidate_remember_browser(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to invalidate all remembered browsers and authentication factors for.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Multifactor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.multifactor.<a href="/lib/auth0/users/multifactor/client.rb">delete_provider</a>(id, provider) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove a <a href="https://auth0.com/docs/multifactor-authentication">multifactor</a> authentication configuration from a user's account. This forces the user to manually reconfigure the multi-factor provider.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.multifactor.delete_provider(
  id: "id",
  provider: "duo"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to remove a multifactor configuration from.
    
</dd>
</dl>

<dl>
<dd>

**provider:** `Auth0::Types::UserMultifactorProviderEnum` — The multi-factor provider. Supported values 'duo' or 'google-authenticator'
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Multifactor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Organizations
<details><summary><code>client.users.organizations.<a href="/lib/auth0/users/organizations/client.rb">list</a>(id) -> Auth0::Types::ListUserOrganizationsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve list of the specified user's current Organization memberships. User must be specified by user ID. For more information, review <a href="https://auth0.com/docs/manage-users/organizations">Auth0 Organizations</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.organizations.list(
  id: "id",
  page: 1,
  per_page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to retrieve the organizations for.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Organizations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Permissions
<details><summary><code>client.users.permissions.<a href="/lib/auth0/users/permissions/client.rb">list</a>(id) -> Auth0::Types::ListUserPermissionsOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all permissions associated with the user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.permissions.list(
  id: "id",
  per_page: 1,
  page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to retrieve the permissions for.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Permissions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.permissions.<a href="/lib/auth0/users/permissions/client.rb">create</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assign permissions to a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.permissions.create(
  id: "id",
  permissions: [{
    resource_server_identifier: "resource_server_identifier",
    permission_name: "permission_name"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to assign permissions to.
    
</dd>
</dl>

<dl>
<dd>

**permissions:** `Internal::Types::Array[Auth0::Types::PermissionRequestPayload]` — List of permissions to add to this user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Permissions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.permissions.<a href="/lib/auth0/users/permissions/client.rb">delete</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove permissions from a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.permissions.delete(
  id: "id",
  permissions: [{
    resource_server_identifier: "resource_server_identifier",
    permission_name: "permission_name"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to remove permissions from.
    
</dd>
</dl>

<dl>
<dd>

**permissions:** `Internal::Types::Array[Auth0::Types::PermissionRequestPayload]` — List of permissions to remove from this user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Permissions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users RiskAssessments
<details><summary><code>client.users.risk_assessments.<a href="/lib/auth0/users/risk_assessments/client.rb">clear</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Clear risk assessment assessors for a specific user
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.risk_assessments.clear(
  id: "id",
  connection: "connection",
  assessors: ["new-device"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to clear assessors for.
    
</dd>
</dl>

<dl>
<dd>

**connection:** `String` — The name of the connection containing the user whose assessors should be cleared.
    
</dd>
</dl>

<dl>
<dd>

**assessors:** `Internal::Types::Array[Auth0::Types::AssessorsTypeEnum]` — List of assessors to clear.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RiskAssessments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Roles
<details><summary><code>client.users.roles.<a href="/lib/auth0/users/roles/client.rb">list</a>(id) -> Auth0::Types::ListUserRolesOffsetPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed list of all user roles currently assigned to a user.

<b>Note</b>: This action retrieves all roles assigned to a user in the context of your whole tenant. To retrieve Organization-specific roles, use the following endpoint: <a href="https://auth0.com/docs/api/management/v2/organizations/get-organization-member-roles">Get user roles assigned to an Organization member</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.roles.list(
  id: "id",
  per_page: 1,
  page: 1,
  include_totals: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to list roles for.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of results per page.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page index of the results to return. First page is 0.
    
</dd>
</dl>

<dl>
<dd>

**include_totals:** `Internal::Types::Boolean` — Return results inside an object that contains the total result count (true) or as a direct array of results (false, default).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.roles.<a href="/lib/auth0/users/roles/client.rb">assign</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assign one or more existing user roles to a user. For more information, review <a href="https://auth0.com/docs/manage-users/access-control/rbac">Role-Based Access Control</a>.

<b>Note</b>: New roles cannot be created through this action. Additionally, this action is used to assign roles to a user in the context of your whole tenant. To assign roles in the context of a specific Organization, use the following endpoint: <a href="https://auth0.com/docs/api/management/v2/organizations/post-organization-member-roles">Assign user roles to an Organization member</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.roles.assign(
  id: "id",
  roles: ["roles"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to associate roles with.
    
</dd>
</dl>

<dl>
<dd>

**roles:** `Internal::Types::Array[String]` — List of roles IDs to associated with the user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.roles.<a href="/lib/auth0/users/roles/client.rb">delete</a>(id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove one or more specified user roles assigned to a user.

<b>Note</b>: This action removes a role from a user in the context of your whole tenant. If you want to unassign a role from a user in the context of a specific Organization, use the following endpoint: <a href="https://auth0.com/docs/api/management/v2/organizations/delete-organization-member-roles">Delete user roles from an Organization member</a>.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.roles.delete(
  id: "id",
  roles: ["roles"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to remove roles from.
    
</dd>
</dl>

<dl>
<dd>

**roles:** `Internal::Types::Array[String]` — List of roles IDs to remove from the user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Roles::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users RefreshToken
<details><summary><code>client.users.refresh_token.<a href="/lib/auth0/users/refresh_token/client.rb">list</a>(user_id) -> Auth0::Types::ListRefreshTokensPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details for a user's refresh tokens.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.refresh_token.list(
  user_id: "user_id",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — ID of the user to get refresh tokens for
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — An optional cursor from which to start the selection (exclusive).
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RefreshToken::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.refresh_token.<a href="/lib/auth0/users/refresh_token/client.rb">delete</a>(user_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete all refresh tokens for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.refresh_token.delete(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — ID of the user to get remove refresh tokens for
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::RefreshToken::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Sessions
<details><summary><code>client.users.sessions.<a href="/lib/auth0/users/sessions/client.rb">list</a>(user_id) -> Auth0::Types::ListUserSessionsPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details for a user's sessions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.sessions.list(
  user_id: "user_id",
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — ID of the user to get sessions for
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — An optional cursor from which to start the selection (exclusive).
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Sessions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.sessions.<a href="/lib/auth0/users/sessions/client.rb">delete</a>(user_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete all sessions for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.sessions.delete(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — ID of the user to get sessions for
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::Users::Sessions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## VerifiableCredentials Verification Templates
<details><summary><code>client.verifiable_credentials.verification.templates.<a href="/lib/auth0/verifiable_credentials/verification/templates/client.rb">list</a>() -> Auth0::Types::ListVerifiableCredentialTemplatesPaginatedResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List a verifiable credential templates.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.verifiable_credentials.verification.templates.list(
  from: "from",
  take: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Optional Id from which to start selection.
    
</dd>
</dl>

<dl>
<dd>

**take:** `Integer` — Number of results per page. Defaults to 50.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::VerifiableCredentials::Verification::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.verifiable_credentials.verification.templates.<a href="/lib/auth0/verifiable_credentials/verification/templates/client.rb">create</a>(request) -> Auth0::Types::CreateVerifiableCredentialTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a verifiable credential template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.verifiable_credentials.verification.templates.create(
  name: "name",
  type: "type",
  dialect: "dialect",
  presentation: {
    org_iso1801351m_dl: {
      org_iso1801351: {}
    }
  },
  well_known_trusted_issuers: "well_known_trusted_issuers"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**type:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**dialect:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**presentation:** `Auth0::Types::MdlPresentationRequest` 
    
</dd>
</dl>

<dl>
<dd>

**custom_certificate_authority:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**well_known_trusted_issuers:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::VerifiableCredentials::Verification::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.verifiable_credentials.verification.templates.<a href="/lib/auth0/verifiable_credentials/verification/templates/client.rb">get</a>(id) -> Auth0::Types::GetVerifiableCredentialTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a verifiable credential template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.verifiable_credentials.verification.templates.get(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the template to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::VerifiableCredentials::Verification::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.verifiable_credentials.verification.templates.<a href="/lib/auth0/verifiable_credentials/verification/templates/client.rb">delete</a>(id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a verifiable credential template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.verifiable_credentials.verification.templates.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the template to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::VerifiableCredentials::Verification::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.verifiable_credentials.verification.templates.<a href="/lib/auth0/verifiable_credentials/verification/templates/client.rb">update</a>(id, request) -> Auth0::Types::UpdateVerifiableCredentialTemplateResponseContent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a verifiable credential template.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.verifiable_credentials.verification.templates.update(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the template to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**type:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**dialect:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**presentation:** `Auth0::Types::MdlPresentationRequest` 
    
</dd>
</dl>

<dl>
<dd>

**well_known_trusted_issuers:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Auth0::VerifiableCredentials::Verification::Templates::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>


# Auth0 Ruby on Rails API Example

A minimal Rails API-only application demonstrating authentication and management API usage with the Auth0 Ruby SDK.

## Setup

1. Copy the environment file and fill in your Auth0 credentials:

   ```bash
   cp .env.example .env
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Start the server:

   ```bash
   bin/rails server -p 3000
   ```

## Endpoints

| Endpoint | Auth Required | Description |
|----------|--------------|-------------|
| `GET /api/public` | No | Returns a public message |
| `GET /api/private` | Yes | Returns a message with the authenticated user's `sub` claim |
| `GET /api/users` | Yes | Lists users from the Management API via `Auth0::Client` |

## Testing

```bash
# Public endpoint
curl http://localhost:3000/api/public

# Private endpoint (replace TOKEN with a valid Auth0 access token)
curl -H "Authorization: Bearer TOKEN" http://localhost:3000/api/private

# Management API endpoint
curl -H "Authorization: Bearer TOKEN" http://localhost:3000/api/users
```

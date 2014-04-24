# OmniAuth Auth0

This is the official OmniAuth strategy for authenticating to [Auth0](https://auth0.com).

## Basic Usage

### Rails

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :auth0, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], ENV['YOUR_NAMESPACE']
    end

### Sinatra

    use OmniAuth::Builder do
      provider :auth0, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], ENV['YOUR_NAMESPACE']
    end

> Optional you can set the `:provider_ignores_state` passing a fourth parameter. By default it is true.

## Connections

You can authorize many connections through Auth0. Link to

    /auth/auth0?connection=<connection>

## Documentation

For more information about [auth0](http://auth0.com) contact our [documentation page](http://docs.auth0.com/).

## License

This client library is MIT licensed.

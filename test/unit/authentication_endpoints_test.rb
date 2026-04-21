# frozen_string_literal: true

require_relative "../test_helper"
require "minitest/autorun"
require "webmock"
require "json"
require "openssl"

# Minimal test class that includes auth mixins for unit testing endpoints directly
class DummyClassForTokens
  include Auth0::Mixins::HTTPProxy
  include Auth0::Mixins::Headers
  include Auth0::Mixins::TokenManagement
  include Auth0::Mixins::Initializer

  def initialize(config)
    extend Auth0::Api::AuthenticationEndpoints

    @client_id = config[:client_id]
    @client_secret = config[:client_secret]
    @audience = config[:api_identifier]
    @domain = config[:domain]
    @base_uri = "https://#{@domain}"
    @token = config[:token]
    @token_expires_at = config[:token_expires_at]
    @client_assertion_signing_key = config[:client_assertion_signing_key]
    @client_assertion_signing_alg = config[:client_assertion_signing_alg] || "RS256"
    @headers ||= {}
  end
end

class AuthenticationEndpointsTest < Minitest::Test
  include WebMock::API

  def setup
    WebMock.enable!
    WebMock.disable_net_connect!

    @client_id = "test-client-id"
    @client_secret = "test-client-secret"
    @api_identifier = "test-audience"
    @domain = "samples.auth0.com"

    @rsa_private = OpenSSL::PKey::RSA.generate(2048)

    @client_secret_config = {
      domain: @domain,
      client_id: @client_id,
      client_secret: @client_secret,
      token: "test",
      api_identifier: @api_identifier
    }

    @client_assertion_config = {
      domain: @domain,
      client_id: @client_id,
      client_assertion_signing_key: @rsa_private,
      client_assertion_signing_alg: "RS256",
      token: "test",
      api_identifier: @api_identifier
    }

    @client_secret_instance = DummyClassForTokens.new(@client_secret_config)
    @client_assertion_instance = DummyClassForTokens.new(@client_assertion_config)
  end

  def teardown
    WebMock.reset!
    WebMock.allow_net_connect!
    WebMock.disable!
  end

  # --- api_token ---

  def test_api_token_with_client_secret
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "client_credentials" &&
          body[:client_id] == @client_id &&
          body[:client_secret] == @client_secret &&
          body[:audience] == @api_identifier
      end
      .to_return(
        status: 200,
        body: { "access_token" => "test_response", "expires_in" => 86_400, "scope" => "scope" }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:api_token, audience: @api_identifier)

    assert_kind_of Auth0::ApiToken, result
    refute_nil result.access_token
    refute_nil result.scope
    refute_nil result.expires_in
  end

  def test_api_token_with_organization
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:organization] == "foo"
      end
      .to_return(
        status: 200,
        body: { "access_token" => "test_response", "expires_in" => 86_400, "scope" => "scope" }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:api_token, audience: @api_identifier, organization: "foo")

    assert_kind_of Auth0::ApiToken, result
    refute_nil result.access_token
  end

  def test_api_token_with_client_assertion
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:client_secret].nil? &&
          !body[:client_assertion].nil? &&
          body[:client_assertion_type] == Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      end
      .to_return(
        status: 200,
        body: { "access_token" => "test_response", "expires_in" => 86_400, "scope" => "scope" }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_assertion_instance.send(:api_token, audience: @api_identifier)

    assert_kind_of Auth0::ApiToken, result
    refute_nil result.access_token
  end

  # --- exchange_auth_code_for_tokens ---

  def test_exchange_auth_code_for_tokens_with_client_secret
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "authorization_code" &&
          body[:code] == "the_auth_code" &&
          body[:client_secret] == @client_secret
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:exchange_auth_code_for_tokens, "the_auth_code")

    assert_kind_of Auth0::AccessToken, result
    refute_nil result.id_token
    refute_nil result.access_token
    refute_nil result.expires_in
  end

  def test_exchange_auth_code_for_tokens_with_client_assertion
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:client_secret].nil? &&
          !body[:client_assertion].nil? &&
          body[:client_assertion_type] == Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_assertion_instance.send(:exchange_auth_code_for_tokens, "the_auth_code")

    assert_kind_of Auth0::AccessToken, result
    refute_nil result.access_token
  end

  # --- exchange_refresh_token ---

  def test_exchange_refresh_token_with_client_secret
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "refresh_token" &&
          body[:refresh_token] == "the_refresh_token" &&
          body[:client_secret] == @client_secret
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:exchange_refresh_token, "the_refresh_token")

    assert_kind_of Auth0::AccessToken, result
    refute_nil result.access_token
  end

  def test_exchange_refresh_token_with_client_assertion
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "refresh_token" &&
          body[:client_secret].nil? &&
          !body[:client_assertion].nil? &&
          body[:client_assertion_type] == Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_assertion_instance.send(:exchange_refresh_token, "the_refresh_token")

    assert_kind_of Auth0::AccessToken, result
    refute_nil result.access_token
  end

  # --- exchange_sms_otp_for_tokens ---

  def test_exchange_sms_otp_for_tokens
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "http://auth0.com/oauth/grant-type/passwordless/otp" &&
          body[:username] == "phone_number" &&
          body[:realm] == "sms" &&
          body[:otp] == "code" &&
          body[:client_id] == @client_id &&
          body[:scope] == "openid profile email"
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:exchange_sms_otp_for_tokens, "phone_number", "code")

    assert_kind_of Auth0::AccessToken, result
    refute_nil result.access_token
  end

  def test_exchange_sms_otp_for_tokens_with_scope_override
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:scope] == "openid" && body[:audience] == @api_identifier
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:exchange_sms_otp_for_tokens, "phone_number", "code",
                                          audience: @api_identifier, scope: "openid")

    assert_kind_of Auth0::AccessToken, result
  end

  def test_exchange_sms_otp_for_tokens_with_client_assertion
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "http://auth0.com/oauth/grant-type/passwordless/otp" &&
          body[:client_secret].nil? &&
          !body[:client_assertion].nil? &&
          body[:client_assertion_type] == Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    @client_assertion_instance.send(:exchange_sms_otp_for_tokens, "phone_number", "code")
  end

  # --- exchange_email_otp_for_tokens ---

  def test_exchange_email_otp_for_tokens
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "http://auth0.com/oauth/grant-type/passwordless/otp" &&
          body[:username] == "email_address" &&
          body[:realm] == "email" &&
          body[:otp] == "code" &&
          body[:scope] == "openid profile email"
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:exchange_email_otp_for_tokens, "email_address", "code")

    assert_kind_of Auth0::AccessToken, result
    refute_nil result.access_token
  end

  def test_exchange_email_otp_for_tokens_with_scope_override
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:scope] == "openid" && body[:audience] == @api_identifier
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    @client_secret_instance.send(:exchange_email_otp_for_tokens, "email_address", "code",
                                 audience: @api_identifier, scope: "openid")
  end

  def test_exchange_email_otp_for_tokens_with_client_assertion
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:client_secret].nil? &&
          !body[:client_assertion].nil? &&
          body[:client_assertion_type] == Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    @client_assertion_instance.send(:exchange_email_otp_for_tokens, "email_address", "code")
  end

  # --- login_with_resource_owner ---

  def test_login_with_resource_owner_client_secret
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:username] == "the_username" &&
          body[:password] == "the_password" &&
          body[:grant_type] == "password" &&
          body[:client_secret] == @client_secret
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:login_with_resource_owner, "the_username", "the_password")

    assert_kind_of Auth0::AccessToken, result
    refute_nil result.access_token
  end

  def test_login_with_resource_owner_realm_and_audience
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "http://auth0.com/oauth/grant-type/password-realm" &&
          body[:realm] == "my-realm" &&
          body[:audience] == @api_identifier
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:login_with_resource_owner, "the_username", "the_password",
                                          realm: "my-realm", audience: @api_identifier)

    assert_kind_of Auth0::AccessToken, result
  end

  def test_login_with_resource_owner_client_assertion
    stub_request(:post, "https://#{@domain}/oauth/token")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:grant_type] == "password" &&
          body[:client_secret].nil? &&
          !body[:client_assertion].nil? &&
          body[:client_assertion_type] == Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      end
      .to_return(
        status: 200,
        body: { "id_token" => "id_token", "access_token" => "test_access_token", "expires_in" => 86_400 }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_assertion_instance.send(:login_with_resource_owner, "the_username", "the_password")

    assert_kind_of Auth0::AccessToken, result
  end

  # --- start_passwordless_email_flow ---

  def test_start_passwordless_email_flow_with_client_secret
    stub_request(:post, "https://#{@domain}/passwordless/start")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:email] == "email@test.com" &&
          body[:send] == "link" &&
          body[:connection] == "email" &&
          body[:client_secret] == @client_secret
      end
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    @client_secret_instance.send(:start_passwordless_email_flow, "email@test.com")
  end

  def test_start_passwordless_email_flow_with_client_assertion
    stub_request(:post, "https://#{@domain}/passwordless/start")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:client_secret].nil? &&
          !body[:client_assertion].nil? &&
          body[:client_assertion_type] == Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      end
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    @client_assertion_instance.send(:start_passwordless_email_flow, "email@test.com")
  end

  # --- start_passwordless_sms_flow ---

  def test_start_passwordless_sms_flow_with_client_secret
    stub_request(:post, "https://#{@domain}/passwordless/start")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:phone_number] == "123456789" &&
          body[:connection] == "sms" &&
          body[:client_secret] == @client_secret
      end
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    @client_secret_instance.send(:start_passwordless_sms_flow, "123456789")
  end

  def test_start_passwordless_sms_flow_with_client_assertion
    stub_request(:post, "https://#{@domain}/passwordless/start")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:client_secret].nil? &&
          !body[:client_assertion].nil? &&
          body[:client_assertion_type] == Auth0::ClientAssertion::CLIENT_ASSERTION_TYPE
      end
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    @client_assertion_instance.send(:start_passwordless_sms_flow, "123456789")
  end

  # --- par_authorization_url ---

  def test_par_authorization_url_raises_on_nil
    assert_raises(Auth0::InvalidParameter) do
      @client_secret_instance.send(:par_authorization_url, nil)
    end
  end

  def test_par_authorization_url_raises_on_empty
    assert_raises(Auth0::InvalidParameter) do
      @client_secret_instance.send(:par_authorization_url, "")
    end
  end

  def test_par_authorization_url_builds_correctly
    request_uri = "urn:ietf:params:oauth:request_uri:the.request.uri"
    url = @client_secret_instance.send(:par_authorization_url, request_uri)

    parsed = URI.parse(url.to_s)
    params = CGI.parse(parsed.query)

    assert_equal @client_id, params["client_id"].first
    assert_equal request_uri, params["request_uri"].first
    assert_equal "/authorize", parsed.path
    assert_equal @domain, parsed.host
  end

  # --- pushed_authorization_request ---

  def test_pushed_authorization_request_as_form_post
    stub_request(:post, "https://#{@domain}/oauth/par")
      .with do |req|
        # Form post: payload is not JSON, it's form data
        req.headers["Content-Type"].nil? || !req.headers["Content-Type"].include?("application/json")
      end
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    @client_secret_instance.send(:pushed_authorization_request)
  end

  def test_pushed_authorization_request_with_all_overrides
    stub_request(:post, "https://#{@domain}/oauth/par")
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    @client_secret_instance.send(:pushed_authorization_request,
                                 response_type: "id_token",
                                 redirect_uri: "http://localhost:3000",
                                 organization: "org_id",
                                 invitation: "http://invite.url",
                                 scope: "openid",
                                 state: "random_value",
                                 connection: "google-oauth2")
  end

  def test_pushed_authorization_request_with_client_assertion
    stub_request(:post, "https://#{@domain}/oauth/par")
      .with do |_req|
        # For form posts, the payload is passed as-is (not JSON encoded)
        true
      end
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    @client_assertion_instance.send(:pushed_authorization_request)
  end

  # --- signup ---

  def test_signup
    stub_request(:post, "https://#{@domain}/dbconnections/signup")
      .with do |req|
        body = JSON.parse(req.body, symbolize_names: true)
        body[:email] == "test@example.com" &&
          body[:password] == "password123" &&
          body[:connection] == "Username-Password-Authentication"
      end
      .to_return(
        status: 200,
        body: { "email" => "test@example.com", "_id" => "abc123" }.to_json,
        headers: { "Content-Type" => "application/json" }
      )

    result = @client_secret_instance.send(:signup, "test@example.com", "password123")

    assert_equal "test@example.com", result["email"]
  end

  # --- authorization_url ---

  def test_authorization_url
    url = @client_secret_instance.send(:authorization_url, "http://localhost:3000/callback")

    assert_includes url.to_s, "https://#{@domain}/authorize"
    assert_includes url.to_s, "client_id=#{@client_id}"
    assert_includes url.to_s, "response_type=code"
  end

  def test_authorization_url_raises_on_empty_redirect
    assert_raises(Auth0::InvalidParameter) do
      @client_secret_instance.send(:authorization_url, "")
    end
  end

  # --- logout_url ---

  def test_logout_url
    url = @client_secret_instance.send(:logout_url, "http://localhost:3000")

    assert_includes url.to_s, "https://#{@domain}/v2/logout"
    assert_includes url.to_s, "returnTo="
  end
end

# rubocop:disable Metrics/BlockLength
require 'spec_helper'

RSA_PUB_KEY_1_PEM = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuGbXWiK3dQTyCbX5xdE4\nyCuYp0AF2d15Qq1JSXT/lx8CEcXb9RbDddl8jGDv+spi5qPa8qEHiK7FwV2KpRE9\n83wGPnYsAm9BxLFb4YrLYcDFOIGULuk2FtrPS512Qea1bXASuvYXEpQNpGbnTGVs\nWXI9C+yjHztqyL2h8P6mlThPY9E9ue2fCqdgixfTFIF9Dm4SLHbphUS2iw7w1JgT\n69s7of9+I9l5lsJ9cozf1rxrXX4V1u/SotUuNB3Fp8oB4C1fLBEhSlMcUJirz1E8\nAziMCxS+VrRPDM+zfvpIJg3JljAh3PJHDiLu902v9w+Iplu1WyoB2aPfitxEhRN0\nYwIDAQAB\n-----END PUBLIC KEY-----\n"
RSA_PUB_KEY_2_PEM = "-----BEGIN PUBLIC KEY-----\nMDowDQYJKoZIhvcNAQEBBQADKQAwJgIfAI7TBUCn8e1hj/fNpb5dqMf8Jj6Ja6qN\npqyeOGYEzAIDAQAB\n-----END PUBLIC KEY-----\n"
RSA_PUB_KEY_1_JWK = { 'kty': "RSA", 'use': 'sig', 'n': "uGbXWiK3dQTyCbX5xdE4yCuYp0AF2d15Qq1JSXT_lx8CEcXb9RbDddl8jGDv-spi5qPa8qEHiK7FwV2KpRE983wGPnYsAm9BxLFb4YrLYcDFOIGULuk2FtrPS512Qea1bXASuvYXEpQNpGbnTGVsWXI9C-yjHztqyL2h8P6mlThPY9E9ue2fCqdgixfTFIF9Dm4SLHbphUS2iw7w1JgT69s7of9-I9l5lsJ9cozf1rxrXX4V1u_SotUuNB3Fp8oB4C1fLBEhSlMcUJirz1E8AziMCxS-VrRPDM-zfvpIJg3JljAh3PJHDiLu902v9w-Iplu1WyoB2aPfitxEhRN0Yw", 'e': 'AQAB', 'kid': 'test-key-1' }
RSA_PUB_KEY_2_JWK = { 'kty': "RSA", 'use': 'sig', 'n': 'jtMFQKfx7WGP982lvl2ox_wmPolrqo2mrJ44ZgTM', 'e': 'AQAB', 'kid': 'test-key-2' }
JWKS_RESPONSE_SINGLE_KEY = { 'keys': [RSA_PUB_KEY_1_JWK] }
JWKS_RESPONSE_MULTIPLE_KEYS = { 'keys': [RSA_PUB_KEY_1_JWK, RSA_PUB_KEY_2_JWK] }
JWKS_URL = 'https://tokens-test.auth0.com/.well-known/jwks.json'
HMAC_SHARED_SECRET = 'secret'

MOCKED_CLOCK = 1587592561  # Apr 22 2020 21:56:01 UTC
DEFAULT_LEEWAY = 60

describe Auth0::IdTokenValidator do
  subject { @instance }

  context 'ID token decoding' do
    before :all do
      @instance = Auth0::IdTokenValidator.new({})
    end

    it "is expected to raise an error with an invalid format" do
      expect { @instance.validate 'a.b' }
        .to raise_exception('ID token could not be decoded.')
      expect { @instance.validate 'a.b.' }
        .to raise_exception('ID token could not be decoded.')
      expect { @instance.validate 'a.b.c.d' }
        .to raise_exception('ID token could not be decoded.')
    end
  end

  context 'HS256 signature verification' do
    before :all do
      algorithm = Auth0::Algorithm::HS256.secret(HMAC_SHARED_SECRET)
      @instance = Auth0::IdTokenValidator.new({ algorithm: algorithm })
    end

    it "is expected to pass with a valid signature" do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.Hn38QVtN_mWN0c-jOa-Fqq69kXpbBp0THsvE-CQ47Ps'

      expect { @instance.validate token }.not_to raise_error
    end

    it "is expected to raise an error with an invalid signature" do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.invalidsignature'

      expect { @instance.validate token }.to raise_exception('Invalid token signature.')
    end
  end

  context 'RS256 signature verification' do
    before :all do
      stub_request(:get, JWKS_URL).to_return(body: JWKS_RESPONSE_SINGLE_KEY.to_json)
      algorithm = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      @instance = Auth0::IdTokenValidator.new({ algorithm: algorithm })
    end

    it "is expected to pass with a valid signature" do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTEifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.jE00ARUiAwrKEoAMwbioKYj4bUZjmg31V7McDtIPsJJ16rYcvI-e5mtSSMgCmAom6t-WA7dsSWCJUlBCW2nAMvyCZ-hj8HG9Z0RmQEiwig9Fk22avoX94zdx65TwAeDfn2uMRaX_ps3TJcn4nymUtMp8Lps_vMw15eJerKThlSO4KuLTrvDDdRaCRamAd7jxuzhiwOt0mB0TVD55b5itA02pGuyapbjQXvvLYEx8OgpyIaAkB9Ry25abgjev0bSw2kjFZckG3lv9QgvZM85m9l3Rbrc6msNPGfMDFWGyT3Tu2ObqnSEA-57hZeuCbFrOya3vUwgSlc66rfvZj2xpzg'

      expect { @instance.validate token }.not_to raise_error
    end

    it "is expected to raise an error with an invalid signature" do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTEifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.invalidsignature'

      expect { @instance.validate token }.to raise_exception('Invalid token signature.')
    end
  end
end
# rubocop:enable Metrics/BlockLength

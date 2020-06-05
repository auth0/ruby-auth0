# rubocop:disable Metrics/BlockLength
require 'spec_helper'

RSA_PUB_KEY_JWK_1 = { 'kty': "RSA", 'use': 'sig', 'n': "uGbXWiK3dQTyCbX5xdE4yCuYp0AF2d15Qq1JSXT_lx8CEcXb9RbDddl8jGDv-spi5qPa8qEHiK7FwV2KpRE983wGPnYsAm9BxLFb4YrLYcDFOIGULuk2FtrPS512Qea1bXASuvYXEpQNpGbnTGVsWXI9C-yjHztqyL2h8P6mlThPY9E9ue2fCqdgixfTFIF9Dm4SLHbphUS2iw7w1JgT69s7of9-I9l5lsJ9cozf1rxrXX4V1u_SotUuNB3Fp8oB4C1fLBEhSlMcUJirz1E8AziMCxS-VrRPDM-zfvpIJg3JljAh3PJHDiLu902v9w-Iplu1WyoB2aPfitxEhRN0Yw", 'e': 'AQAB', 'kid': 'test-key-1' }.freeze
RSA_PUB_KEY_JWK_2 = { 'kty': "RSA", 'use': 'sig', 'n': "uGbXWiK3dQTyCbX5xdE4yCuYp0AF2d15Qq1JSXT_lx8CEcXb9RbDddl8jGDv-spi5qPa8qEHiK7FwV2KpRE983wGPnYsAm9BxLFb4YrLYcDFOIGULuk2FtrPS512Qea1bXASuvYXEpQNpGbnTGVsWXI9C-yjHztqyL2h8P6mlThPY9E9ue2fCqdgixfTFIF9Dm4SLHbphUS2iw7w1JgT69s7of9-I9l5lsJ9cozf1rxrXX4V1u_SotUuNB3Fp8oB4C1fLBEhSlMcUJirz1E8AziMCxS-VrRPDM-zfvpIJg3JljAh3PJHDiLu902v9w-Iplu1WyoB2aPfitxEhRN0Yw", 'e': 'AQAB', 'kid': 'test-key-2' }.freeze
JWKS_RESPONSE_1 = { 'keys': [RSA_PUB_KEY_JWK_1] }.freeze
JWKS_RESPONSE_2 = { 'keys': [RSA_PUB_KEY_JWK_2] }.freeze
JWKS_URL = 'https://tokens-test.auth0.com/.well-known/jwks.json'.freeze
HMAC_SHARED_SECRET = 'secret'.freeze

MOCKED_CLOCK = 1587592561 # Apr 22 2020 21:56:01 UTC
DEFAULT_LEEWAY = 60

describe Auth0::Mixins::Validation::IdTokenValidator do
  subject { @instance }

  context 'instance' do
    it 'is expected respond to :validate' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new({})

      expect(instance).to respond_to(:validate)
    end
  end

  context 'ID token decoding' do
    expected_error = 'ID token could not be decoded'
    instance = Auth0::Mixins::Validation::IdTokenValidator.new({})

    it 'is expected to raise an error with a nil id_token' do
      expect { instance.validate(nil) }.to raise_exception(expected_error)
    end

    it 'is expected to raise an error with an empty id_token' do
      expect { instance.validate('') }.to raise_exception(expected_error)
    end

    it 'is expected to raise an error with an invalid format' do
      expect { instance.validate('a.b') }.to raise_exception(expected_error)
      expect { instance.validate('a.b.') }.to raise_exception(expected_error)
      expect { instance.validate('a.b.c.d') }.to raise_exception(expected_error)
    end

    it 'is expected to raise an error with an invalid encoding' do
      expect { instance.validate('a.b.c') }.to raise_exception(expected_error)
    end
  end

  context 'algorithm verification' do
    token = 'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.Hn38QVtN_mWN0c-jOa-Fqq69kXpbBp0THsvE-CQ47Ps'

    it 'is expected to raise an error with an unsupported algorithm' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new({ algorithm: 'ES256' })

      expect { instance.validate(token) }.to raise_exception('Signature algorithm of "ES256" is not supported')
    end

    it 'is expected to raise an error when the algorithm does not match the alg header value' do
      algorithm = Auth0::Algorithm::HS256.secret(HMAC_SHARED_SECRET)
      instance = Auth0::Mixins::Validation::IdTokenValidator.new({ algorithm: algorithm })

      expect { instance.validate(token) }.to raise_exception('Signature algorithm of "ES256" is not supported. Expected the ID token to be signed with "HS256"')
    end
  end

  context 'HS256 signature verification' do
    before :each do
      algorithm = Auth0::Algorithm::HS256.secret(HMAC_SHARED_SECRET)
      @instance = Auth0::Mixins::Validation::IdTokenValidator.new({ algorithm: algorithm })
    end

    it 'is expected not to raise an error with a valid signature' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.Hn38QVtN_mWN0c-jOa-Fqq69kXpbBp0THsvE-CQ47Ps'

      expect { @instance.validate(token) }.not_to raise_exception
    end

    it 'is expected to raise an error with an invalid signature' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.invalidsignature'

      expect { @instance.validate(token) }.to raise_exception('Invalid ID token signature')
    end
  end

  context 'RS256 signature verification' do
    before :each do
      stub_jwks
      algorithm = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      @instance = Auth0::Mixins::Validation::IdTokenValidator.new({ algorithm: algorithm })
    end

    after :each do
      Auth0::Algorithm::RS256.remove_jwks
      WebMock.reset!
    end

    it 'is expected not to raise an error with a valid signature' do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTEifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.jE00ARUiAwrKEoAMwbioKYj4bUZjmg31V7McDtIPsJJ16rYcvI-e5mtSSMgCmAom6t-WA7dsSWCJUlBCW2nAMvyCZ-hj8HG9Z0RmQEiwig9Fk22avoX94zdx65TwAeDfn2uMRaX_ps3TJcn4nymUtMp8Lps_vMw15eJerKThlSO4KuLTrvDDdRaCRamAd7jxuzhiwOt0mB0TVD55b5itA02pGuyapbjQXvvLYEx8OgpyIaAkB9Ry25abgjev0bSw2kjFZckG3lv9QgvZM85m9l3Rbrc6msNPGfMDFWGyT3Tu2ObqnSEA-57hZeuCbFrOya3vUwgSlc66rfvZj2xpzg'

      expect { @instance.validate(token) }.not_to raise_exception
    end

    it 'is expected to raise an error with an invalid signature' do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTEifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.invalidsignature'

      expect { @instance.validate(token) }.to raise_exception('Invalid ID token signature')
    end

    it 'is expected to raise an error when the public key cannot be found' do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTIifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.r2ksgiiM8zGJ6byea_Fq_zWWEmUdOnwQLVdb5JzgdBv1GUQFp-4LNaRhcga4FIrbKgxaPeewGLTq2VqfjmNJUNfARcE3QEacQ_JEHkC6zKZIiqcu4msHl8X9HXyHxOPHMTTjYMjauPzET7UH_oLxF68DDDQqvKX9VqLsncpyC-KdTCFTLGlFSq6pxmYt6gwrF2Uo15Gzc6qe2I9-MTXCYd44VW1zQi6GhNJNKbXH6U3bf7nof0ot1PSjBXXuLgf6d3qumTStECCjIUmdBb6FiEX4SSRI4MgHWj4q0LyN28baRpYwYPhVnjzUxOP7OLjKiHs45ORBhuAWhrJnuR_uBQ'

      expect { @instance.validate(token) }.to raise_exception('Could not find a public key for Key ID (kid) "test-key-2"')
    end

    it 'is expected to fetch the JWK set from the url if the public key cannot be found and the cache is not empty' do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTIifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.r2ksgiiM8zGJ6byea_Fq_zWWEmUdOnwQLVdb5JzgdBv1GUQFp-4LNaRhcga4FIrbKgxaPeewGLTq2VqfjmNJUNfARcE3QEacQ_JEHkC6zKZIiqcu4msHl8X9HXyHxOPHMTTjYMjauPzET7UH_oLxF68DDDQqvKX9VqLsncpyC-KdTCFTLGlFSq6pxmYt6gwrF2Uo15Gzc6qe2I9-MTXCYd44VW1zQi6GhNJNKbXH6U3bf7nof0ot1PSjBXXuLgf6d3qumTStECCjIUmdBb6FiEX4SSRI4MgHWj4q0LyN28baRpYwYPhVnjzUxOP7OLjKiHs45ORBhuAWhrJnuR_uBQ'
      Auth0::Algorithm::RS256.jwks_url(JWKS_URL).jwks
      stub_jwks(JWKS_RESPONSE_2)
      @instance.validate(token)

      expect(a_request(:get, JWKS_URL)).to have_been_made.twice
    end
  end
end

describe Auth0::Algorithm::HS256 do
  context 'class' do
    it 'is expected to respond to :secret' do
      expect(Auth0::Algorithm::HS256).to respond_to(:secret)
    end

    it 'is expected not to respond to :new' do
      expect(Auth0::Algorithm::HS256).not_to respond_to(:new)
    end
  end

  context 'instance' do
    it 'is expected to respond to :secret' do
      instance = Auth0::Algorithm::HS256.secret('secret')

      expect(instance).to respond_to(:secret)
    end

    it 'is expected to return the secret' do
      instance = Auth0::Algorithm::HS256.secret('secret')

      expect(instance.secret).to eq('secret')
    end

    it 'is expected to return the algorithm name' do
      instance = Auth0::Algorithm::HS256.secret('secret')

      expect(instance.name).to eq('HS256')
    end
  end

  context 'parameters' do
    expected_error = 'Must supply a valid secret'

    it 'is expected to raise an error with a nil secret' do
      expect { Auth0::Algorithm::HS256.secret(nil) }.to raise_exception(expected_error)
    end

    it 'is expected to raise an error with an empty secret' do
      expect { Auth0::Algorithm::HS256.secret('') }.to raise_exception(expected_error)
    end
  end
end

describe Auth0::Algorithm::RS256 do
  before :each do
    stub_jwks
  end

  after :each do
    Auth0::Algorithm::RS256.remove_jwks
    WebMock.reset!
  end

  context 'class' do
    it 'is expected to respond to :jwks_url' do
      expect(Auth0::Algorithm::RS256).to respond_to(:jwks_url)
    end

    it 'is expected not to respond to :new' do
      expect(Auth0::Algorithm::RS256).not_to respond_to(:new)
    end
  end

  context 'instance' do
    it 'is expected to respond to :jwks' do
      instance = Auth0::Algorithm::RS256.jwks_url('jwks url')

      expect(instance).to respond_to(:jwks)
    end

    it 'is expected to respond to :fetched_jwks?' do
      instance = Auth0::Algorithm::RS256.jwks_url('jwks url')

      expect(instance).to respond_to(:fetched_jwks?)
    end

    it 'is expected to return a jwks' do
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)

      expect(instance.jwks).to have_key('keys') and contain_exactly(a_hash_including(kid: 'test-key-1'))
    end

    it 'is expected to return if the jwks was fetched from the url' do
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      instance.jwks

      expect(instance.fetched_jwks?).to eq(true)
    end

    it 'is expected to return if the jwks was fetched from the cache' do
      Auth0::Algorithm::RS256.jwks_url(JWKS_URL).jwks
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      instance.jwks

      expect(instance.fetched_jwks?).to eq(false)
    end

    it 'is expected to return the algorithm name' do
      instance = Auth0::Algorithm::RS256.jwks_url('jwks url')

      expect(instance.name).to eq('RS256')
    end
  end

  context 'parameters' do
    it 'is expected to raise an error with a nil jwks_url' do
      expect { Auth0::Algorithm::RS256.jwks_url(nil) }.to raise_exception('Must supply a valid jwks_url')
    end

    it 'is expected to raise an error with an empty jwks_url' do
      expect { Auth0::Algorithm::RS256.jwks_url('') }.to raise_exception('Must supply a valid jwks_url')
    end

    it 'is expected to raise an error with a non-integer lifetime' do
      expect { Auth0::Algorithm::RS256.jwks_url('jwks url', lifetime: '1') }.to raise_exception('Must supply a valid lifetime')
    end

    it 'is expected to raise an error with a negative lifetime' do
      expect { Auth0::Algorithm::RS256.jwks_url('jwks url', lifetime: -1) }.to raise_exception('Must supply a valid lifetime')
    end
  end

  context 'cache' do
    it 'is expected to fetch the jwks from the url when the cache is empty' do
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      instance.jwks

      expect(a_request(:get, JWKS_URL)).to have_been_made.once
    end

    it 'is expected to fetch the jwks from the url when the cache is expired' do
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL, lifetime: 0)
      instance.jwks
      instance.jwks

      expect(a_request(:get, JWKS_URL)).to have_been_made.twice
    end

    it 'is not expected to fetch the jwks from the url when there is a value cached' do
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      instance.jwks
      instance.jwks

      expect(a_request(:get, JWKS_URL)).to have_been_made.once
    end

    it 'is expected to forcibly fetch the jwks from the url' do
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      instance.jwks
      instance.jwks(force: true)

      expect(a_request(:get, JWKS_URL)).to have_been_made.twice
    end

    it 'is expected to forcibly fetch the jwks from the url and cache it' do
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      instance.jwks(force: true)
      instance.jwks

      expect(a_request(:get, JWKS_URL)).to have_been_made.once
    end

    it 'is expected to return the last cached value if the jwks could not be fetched' do
      Auth0::Algorithm::RS256.jwks_url(JWKS_URL).jwks
      stub_request(:get, JWKS_URL).to_return(body: 'invalid')
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)

      expect(instance.jwks).to have_key('keys') and contain_exactly(a_hash_including(kid: 'test-key-1'))
    end

    it 'is expected to raise an error if the jwks could not be fetched and the cache is empty' do
      stub_request(:get, JWKS_URL).to_return(body: 'invalid')
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)

      expect { instance.jwks }.to raise_exception('Could not fetch the JWK set')
    end
  end
end
# rubocop:enable Metrics/BlockLength

def stub_jwks(stub = JWKS_RESPONSE_1)
  stub_request(:get, JWKS_URL).to_return(body: stub.to_json)
end

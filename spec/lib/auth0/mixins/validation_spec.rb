# rubocop:disable Metrics/BlockLength
require 'spec_helper'

RSA_PUB_KEY_JWK_1 = { 'kty': "RSA", 'use': 'sig', 'n': "uGbXWiK3dQTyCbX5xdE4yCuYp0AF2d15Qq1JSXT_lx8CEcXb9RbDddl8jGDv-spi5qPa8qEHiK7FwV2KpRE983wGPnYsAm9BxLFb4YrLYcDFOIGULuk2FtrPS512Qea1bXASuvYXEpQNpGbnTGVsWXI9C-yjHztqyL2h8P6mlThPY9E9ue2fCqdgixfTFIF9Dm4SLHbphUS2iw7w1JgT69s7of9-I9l5lsJ9cozf1rxrXX4V1u_SotUuNB3Fp8oB4C1fLBEhSlMcUJirz1E8AziMCxS-VrRPDM-zfvpIJg3JljAh3PJHDiLu902v9w-Iplu1WyoB2aPfitxEhRN0Yw", 'e': 'AQAB', 'kid': 'test-key-1' }.freeze
RSA_PUB_KEY_JWK_2 = { 'kty': "RSA", 'use': 'sig', 'n': "uGbXWiK3dQTyCbX5xdE4yCuYp0AF2d15Qq1JSXT_lx8CEcXb9RbDddl8jGDv-spi5qPa8qEHiK7FwV2KpRE983wGPnYsAm9BxLFb4YrLYcDFOIGULuk2FtrPS512Qea1bXASuvYXEpQNpGbnTGVsWXI9C-yjHztqyL2h8P6mlThPY9E9ue2fCqdgixfTFIF9Dm4SLHbphUS2iw7w1JgT69s7of9-I9l5lsJ9cozf1rxrXX4V1u_SotUuNB3Fp8oB4C1fLBEhSlMcUJirz1E8AziMCxS-VrRPDM-zfvpIJg3JljAh3PJHDiLu902v9w-Iplu1WyoB2aPfitxEhRN0Yw", 'e': 'AQAB', 'kid': 'test-key-2' }.freeze
JWKS_RESPONSE_1 = { 'keys': [RSA_PUB_KEY_JWK_1] }.freeze
JWKS_RESPONSE_2 = { 'keys': [RSA_PUB_KEY_JWK_2] }.freeze
JWKS_URL = 'https://tokens-test.auth0.com/.well-known/jwks.json'.freeze
HMAC_SHARED_SECRET = 'secret'.freeze

LEEWAY = 60
CLOCK = 1587592561 # Apr 22 2020 21:56:01 UTC
CONTEXT = { algorithm: Auth0::Algorithm::HS256.secret(HMAC_SHARED_SECRET), leeway: LEEWAY, audience: 'tokens-test-123', issuer: 'https://tokens-test.auth0.com/', clock: CLOCK }.freeze

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
      @instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ algorithm: algorithm }))
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
      @instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ algorithm: algorithm }))
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

  context 'context validation' do
    token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.Hn38QVtN_mWN0c-jOa-Fqq69kXpbBp0THsvE-CQ47Ps'

    it 'is expected to raise an error with a non-integer leeway' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ leeway: '1' }))

      expect { instance.validate(token) }.to raise_exception('Must supply a valid leeway')
    end

    it 'is expected to raise an error with a negative leeway' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ leeway: -1 }))

      expect { instance.validate(token) }.to raise_exception('Must supply a valid leeway')
    end

    it 'is expected to raise an error with an empty nonce' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ nonce: '' }))

      expect { instance.validate(token) }.to raise_exception('Must supply a valid nonce')
    end

    it 'is expected to raise an error with an empty issuer' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ issuer: '' }))

      expect { instance.validate(token) }.to raise_exception('Must supply a valid issuer')
    end

    it 'is expected to raise an error with an empty audience' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ audience: '' }))

      expect { instance.validate(token) }.to raise_exception('Must supply a valid audience')
    end

    it 'is expected to raise an error with a non-integer max_age' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ max_age: '1' }))

      expect { instance.validate(token) }.to raise_exception('Must supply a valid max_age')
    end

    it 'is expected to raise an error with a negative max_age' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ max_age: -1 }))

      expect { instance.validate(token) }.to raise_exception('Must supply a valid max_age')
    end
  end

  context 'claims validation' do
    before :all do
      @instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT)
    end

    it 'is expected to raise an error with a missing iss' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.QL2B2tqJhlW9rc8HQ3PQKkjDufBeSvtRBtJmRPdQ5K8'

      expect { @instance.validate(token) }.to raise_exception('Issuer (iss) claim must be a string present in the ID token')
    end

    it 'is expected to raise an error with a invalid iss' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzb21ldGhpbmctZWxzZSIsInN1YiI6ImF1dGgwfDEyMzQ1Njc4OSIsImF1ZCI6WyJ0b2tlbnMtdGVzdC0xMjMiLCJleHRlcm5hbC10ZXN0LTk5OSJdLCJleHAiOjE1ODc3NjUzNjEsImlhdCI6MTU4NzU5MjU2MSwibm9uY2UiOiJhMWIyYzNkNGU1IiwiYXpwIjoidG9rZW5zLXRlc3QtMTIzIiwiYXV0aF90aW1lIjoxNTg3Njc4OTYxfQ.AhMMouDlGMdxTYrY9Cn-p8svJ8ssKmsHeT6JNRVTh10'

      expect { @instance.validate(token) }.to raise_exception("Issuer (iss) claim mismatch in the ID token; expected \"#{CONTEXT[:issuer]}\", found \"something-else\"")
    end

    it 'is expected to raise an error with a missing sub' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0._4sUXtAZYpGrO3QaYArXnk2JivCqixa7hgHhH3w4SlY'

      expect { @instance.validate(token) }.to raise_exception('Subject (sub) claim must be a string present in the ID token')
    end

    it 'is expected to raise an error with a missing aud' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJleHAiOjE1ODc3NjUzNjEsImlhdCI6MTU4NzU5MjU2MSwibm9uY2UiOiJhMWIyYzNkNGU1IiwiYXpwIjoidG9rZW5zLXRlc3QtMTIzIiwiYXV0aF90aW1lIjoxNTg3Njc4OTYxfQ.TlwnBmGUKe0SElSYKxPqsG1mujkK2t1CwDJGGiWRdXA'

      expect { @instance.validate(token) }.to raise_exception('Audience (aud) claim must be a string or array of strings present in the ID token')
    end

    it 'is expected to raise an error with an invalid string aud' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOiJleHRlcm5hbC10ZXN0LTk5OSIsImV4cCI6MTU4Nzc2NTM2MSwiaWF0IjoxNTg3NTkyNTYxLCJub25jZSI6ImExYjJjM2Q0ZTUiLCJhenAiOiJ0b2tlbnMtdGVzdC0xMjMiLCJhdXRoX3RpbWUiOjE1ODc2Nzg5NjF9.-Tf5CIi2bZ51UdgqxFWQNXpJJmK5GgsetcVoVrQwHIA'

      expect { @instance.validate(token) }.to raise_exception("Audience (aud) claim mismatch in the ID token; expected \"#{CONTEXT[:audience]}\", found \"external-test-999\"")
    end

    it 'is expected to raise an error with an invalid array aud' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsiZXh0ZXJuYWwtdGVzdC05OTgiLCJleHRlcm5hbC10ZXN0LTk5OSJdLCJleHAiOjE1ODc3NjUzNjEsImlhdCI6MTU4NzU5MjU2MSwibm9uY2UiOiJhMWIyYzNkNGU1IiwiYXpwIjoidG9rZW5zLXRlc3QtMTIzIiwiYXV0aF90aW1lIjoxNTg3Njc4OTYxfQ.Q1GRVL5g3RLQqG5sEV_cc8WW_oiZzFIAfzRfBdxMW2s'

      expect { @instance.validate(token) }.to raise_exception("Audience (aud) claim mismatch in the ID token; expected \"#{CONTEXT[:audience]}\" but was not one of \"external-test-998, external-test-999\"")
    end

    it 'is expected to raise an error with a missing exp' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiaWF0IjoxNTg3NTkyNTYxLCJub25jZSI6ImExYjJjM2Q0ZTUiLCJhenAiOiJ0b2tlbnMtdGVzdC0xMjMiLCJhdXRoX3RpbWUiOjE1ODc2Nzg5NjF9.aoLiQX3sHsf1bEbc0axbjJ9qV6hhomtEzJq-FT8OGF0'

      expect { @instance.validate(token) }.to raise_exception('Expiration Time (exp) claim must be a number present in the ID token')
    end

    it 'is expected to raise an error with a invalid exp' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NTkyNTYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.A8Pc0vlCG5Ufez7VIoRqXTYpJehalTEgGX9cR2xJLkU'
      clock = CLOCK + LEEWAY + 1
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ clock: clock }))

      expect { instance.validate(token) }.to raise_exception("Expiration Time (exp) claim mismatch in the ID token; current time \"#{clock}\" is after expiration time \"1587592621\"")
    end

    it 'is expected to raise an error with a missing iat' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJub25jZSI6ImExYjJjM2Q0ZTUiLCJhenAiOiJ0b2tlbnMtdGVzdC0xMjMiLCJhdXRoX3RpbWUiOjE1ODc2Nzg5NjF9.Jea6UVJsAK7Hnb494f_WIQCIbaLTnnCvMenSY1Y2toc'

      expect { @instance.validate(token) }.to raise_exception('Issued At (iat) claim must be a number present in the ID token')
    end

    it 'is expected to raise an error with a invalid iat' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc3NjUzNjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.1AeRLTaExbKnmsfNduUl3HArsau4RcNrnmYOJnkPWi0'
      clock = CLOCK - LEEWAY - 1
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ clock: clock }))

      expect { instance.validate(token) }.to raise_exception("Issued At (iat) claim mismatch in the ID token; current time \"#{clock}\" is before issued at time \"1587765301\"")
    end

    it 'is expected not to raise an error with a missing but not required nonce' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.-o5grnyODbBdRgzcrn7Sf9Hb6eOC0x_U2i3YjVgHN0U'

      expect { @instance.validate(token) }.not_to raise_exception
    end

    it 'is expected to raise an error with a missing but required nonce' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.-o5grnyODbBdRgzcrn7Sf9Hb6eOC0x_U2i3YjVgHN0U'
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ nonce: 'a1b2c3d4e5' }))

      expect { instance.validate(token) }.to raise_exception('Nonce (nonce) claim must be a string present in the ID token')
    end

    it 'is expected to raise an error with an invalid nonce' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiMDAwOTk5IiwiYXpwIjoidG9rZW5zLXRlc3QtMTIzIiwiYXV0aF90aW1lIjoxNTg3Njc4OTYxfQ.XqQPdFN4m5kmTUQQi_mAJu0LQOeUTS9lF2J_xWc_j-0'
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ nonce: 'a1b2c3d4e5' }))

      expect { instance.validate(token) }.to raise_exception('Nonce (nonce) claim mismatch in the ID token; expected "a1b2c3d4e5", found "000999"')
    end

    it 'is expected to raise an error with a missing azp' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.LrgYkIbWrxMq6jvvkL1lxWL237ii1IBhtN2o_tDxFns'

      expect { @instance.validate(token) }.to raise_exception('Authorized Party (azp) claim must be a string present in the ID token')
    end

    it 'is expected to raise an error with an invalid azp' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6ImV4dGVybmFsLXRlc3QtOTk5IiwiYXV0aF90aW1lIjoxNTg3Njc4OTYxfQ.3DX-LY3B4UngDML-9nv11Sv89ECJpRpOLeWnkF1vAFY'

      expect { @instance.validate(token) }.to raise_exception("Authorized Party (azp) claim mismatch in the ID token; expected \"tokens-test-123\", found \"external-test-999\"")
    end

    it 'is expected to raise an error with a missing auth_time' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyJ9.JqUotnjHbGW0FcHz1s1YsRkce9Sbpsv2AEBDMpcUhp8'
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ max_age: 120 }))

      expect { instance.validate(token) }.to raise_exception('Authentication Time (auth_time) claim must be a number present in the ID token when Max Age (max_age) is specified')
    end

    it 'is expected to raise an error with a invalid auth_time' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzU5MjU2MX0.B7eWHJPHjhOh0ALjIQi0ro6zVsqGIeHd0gpRZsv6Hg8'
      max_age = 120
      auth_time = CLOCK + LEEWAY + max_age
      clock = auth_time + 1
      instance = Auth0::Mixins::Validation::IdTokenValidator.new(CONTEXT.merge({ max_age: max_age, clock: clock }))

      expect { instance.validate(token) }.to raise_exception("Authentication Time (auth_time) claim in the ID token indicates that too much time has passed since the last end-user authentication. Current time \"#{clock}\" is after last auth at \"#{auth_time}\"")
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

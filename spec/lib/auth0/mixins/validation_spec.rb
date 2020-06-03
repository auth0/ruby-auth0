# rubocop:disable Metrics/BlockLength
require 'spec_helper'

RSA_PUB_KEY_JWK = { 'kty': "RSA", 'use': 'sig', 'n': "uGbXWiK3dQTyCbX5xdE4yCuYp0AF2d15Qq1JSXT_lx8CEcXb9RbDddl8jGDv-spi5qPa8qEHiK7FwV2KpRE983wGPnYsAm9BxLFb4YrLYcDFOIGULuk2FtrPS512Qea1bXASuvYXEpQNpGbnTGVsWXI9C-yjHztqyL2h8P6mlThPY9E9ue2fCqdgixfTFIF9Dm4SLHbphUS2iw7w1JgT69s7of9-I9l5lsJ9cozf1rxrXX4V1u_SotUuNB3Fp8oB4C1fLBEhSlMcUJirz1E8AziMCxS-VrRPDM-zfvpIJg3JljAh3PJHDiLu902v9w-Iplu1WyoB2aPfitxEhRN0Yw", 'e': 'AQAB', 'kid': 'test-key-1' }
JWKS_RESPONSE = { 'keys': [RSA_PUB_KEY_JWK] }
JWKS_URL = 'https://tokens-test.auth0.com/.well-known/jwks.json'
HMAC_SHARED_SECRET = 'secret'

MOCKED_CLOCK = 1587592561  # Apr 22 2020 21:56:01 UTC
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
    it 'is expected to raise an error with an invalid format' do
      instance = Auth0::Mixins::Validation::IdTokenValidator.new({})
      expected_error = 'ID token could not be decoded'

      expect { instance.validate 'a.b' }.to raise_exception(expected_error)
      expect { instance.validate 'a.b.' }.to raise_exception(expected_error)
      expect { instance.validate 'a.b.c.d' }.to raise_exception(expected_error)
    end
  end

  context 'algorithm verification' do
    it 'is expected to raise an error when the algorithm is not supported' do
      algorithm = Auth0::Algorithm::HS256.secret(HMAC_SHARED_SECRET)
      instance = Auth0::Mixins::Validation::IdTokenValidator.new({ algorithm: algorithm })
      token = 'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.Hn38QVtN_mWN0c-jOa-Fqq69kXpbBp0THsvE-CQ47Ps'

      expect { instance.validate token }.to raise_exception('Signature algorithm of "ES256" is not supported. Expected the ID token to be signed with "HS256"')
    end
  end

  context 'HS256 signature verification' do
    before :all do
      algorithm = Auth0::Algorithm::HS256.secret(HMAC_SHARED_SECRET)
      @instance = Auth0::Mixins::Validation::IdTokenValidator.new({ algorithm: algorithm })
    end

    it 'is expected to pass with a valid signature' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.Hn38QVtN_mWN0c-jOa-Fqq69kXpbBp0THsvE-CQ47Ps'

      expect { @instance.validate token }.not_to raise_exception
    end

    it 'is expected to raise an error with an invalid signature' do
      token = 'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.invalidsignature'

      expect { @instance.validate token }.to raise_exception('Invalid ID token signature')
    end
  end

  context 'RS256 signature verification' do
    before :all do
      stub_jwks
      algorithm = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      @instance = Auth0::Mixins::Validation::IdTokenValidator.new({ algorithm: algorithm })
    end

    it 'is expected to pass with a valid signature' do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTEifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.jE00ARUiAwrKEoAMwbioKYj4bUZjmg31V7McDtIPsJJ16rYcvI-e5mtSSMgCmAom6t-WA7dsSWCJUlBCW2nAMvyCZ-hj8HG9Z0RmQEiwig9Fk22avoX94zdx65TwAeDfn2uMRaX_ps3TJcn4nymUtMp8Lps_vMw15eJerKThlSO4KuLTrvDDdRaCRamAd7jxuzhiwOt0mB0TVD55b5itA02pGuyapbjQXvvLYEx8OgpyIaAkB9Ry25abgjev0bSw2kjFZckG3lv9QgvZM85m9l3Rbrc6msNPGfMDFWGyT3Tu2ObqnSEA-57hZeuCbFrOya3vUwgSlc66rfvZj2xpzg'

      expect { @instance.validate token }.not_to raise_exception
    end

    it 'is expected to raise an error with an invalid signature' do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTEifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.invalidsignature'

      expect { @instance.validate token }.to raise_exception('Invalid ID token signature')
    end

    it 'is expected to raise an error when the public key cannot be found' do
      token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6InRlc3Qta2V5LTMifQ.eyJpc3MiOiJodHRwczovL3Rva2Vucy10ZXN0LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHwxMjM0NTY3ODkiLCJhdWQiOlsidG9rZW5zLXRlc3QtMTIzIiwiZXh0ZXJuYWwtdGVzdC05OTkiXSwiZXhwIjoxNTg3NzY1MzYxLCJpYXQiOjE1ODc1OTI1NjEsIm5vbmNlIjoiYTFiMmMzZDRlNSIsImF6cCI6InRva2Vucy10ZXN0LTEyMyIsImF1dGhfdGltZSI6MTU4NzY3ODk2MX0.dQ0-gWcukV3XbVoxPpjGWOpEHXlb3pKK1-FLmB7K0s-wCGc57S_sAK3dGH83teMrD2WCapmPNU5bEJX2r-m3LQf8TbOBvvBz0Wd2hJsMsrZWQmqTSw8BIHGZKuG5qpYsYcrhSRd8lILNuv4yn1oDHFNTf3vGXawYkxzB2-K24fv4hXf_v87z_3Vn_7CArgAnutBV6J6iSd7adI3KCbcn4msJDhK6e39wbKYHosy03etRoLWoIVzKu-aXbGTTOJ4xFdAvODhZpDFCRASJEoXk8nd_KxYFPoxVBIfVoiLGpNSS6yoPLtNuF1Bi83oDW5sqZPV76hXbCDl0IKwlcPemSQ'

      expect { @instance.validate token }.to raise_exception('Could not find a public key for Key ID (kid) "test-key-3"')
    end
  end
end

describe Auth0::Algorithm::HS256 do
  context 'class' do
    it 'is expected to respond to :secret' do
      expect(Auth0::Algorithm::HS256).to respond_to(:secret)
    end

    it 'is expected notto respond to :new' do
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
  end

  context 'parameters' do
    it 'is expected to raise an error with a nil secret' do
      expect { Auth0::Algorithm::RS256.jwks_url(nil) }.to raise_exception
    end

    it 'is expected to raise an error with an empty secret' do
      expect { Auth0::Algorithm::RS256.jwks_url('') }.to raise_exception
    end
  end
end

describe Auth0::Algorithm::RS256 do
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

    it 'is expected to return a jwks' do
      stub_jwks
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)

      expect(instance.jwks).to have_key('keys') and contain_exactly(a_hash_including(kid: 'test-key-1'))
    end
  end

  context 'parameters' do
    it 'is expected to raise an error with a nil jwks_url' do
      expect { Auth0::Algorithm::RS256.jwks_url(nil) }.to raise_exception
    end

    it 'is expected to raise an error with an empty jwks_url' do
      expect { Auth0::Algorithm::RS256.jwks_url('') }.to raise_exception
    end

    it 'is expected to raise an error with a non integer lifetime' do
      expect { Auth0::Algorithm::RS256.jwks_url('jwks url', '1') }.to raise_exception
    end

    it 'is expected to raise an error with a negative lifetime' do
      expect { Auth0::Algorithm::RS256.jwks_url('jwks url', -1) }.to raise_exception
    end
  end

  context 'cache' do
    it 'is expected to fetch the jwks from the web when the cache is empty' do
      stub_jwks
      Auth0::Algorithm::RS256.jwks_url(JWKS_URL).jwks

      WebMock.after_request do
        expect(a_request(:get, JWKS_URL)).to have_been_made.once
      end
    end

    it 'is expected to fetch the jwks from the web when the cache is expired' do
      stub_jwks
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL, lifetime: 0)
      instance.jwks
      instance.jwks

      WebMock.after_request do
        expect(a_request(:get, JWKS_URL)).to have_been_made.twice
      end
    end

    it 'is not expected to fetch the jwks from the web when there is a value cached' do
      stub_jwks
      instance = Auth0::Algorithm::RS256.jwks_url(JWKS_URL)
      instance.jwks
      instance.jwks

      WebMock.after_request do
        expect(a_request(:get, JWKS_URL)).to have_been_made.once
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength

def stub_jwks
  stub_request(:get, JWKS_URL).to_return(body: JWKS_RESPONSE.to_json)
end

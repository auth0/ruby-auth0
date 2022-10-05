require 'json'
require 'spec_helper'

describe Auth0::Mixins::HTTPProxy do
  before :each do
    dummy_instance = DummyClassForProxy.new
    dummy_instance.extend(Auth0::Mixins::HTTPProxy)
    dummy_instance.base_uri = "https://auth0.com"
    dummy_instance.retry_count = 0

    @instance = dummy_instance
    @exception = DummyClassForRestClient.new
  end

  %i(get delete).each do |http_method|
    context ".#{http_method}" do
      it { expect(@instance).to respond_to(http_method.to_sym) }
      it "should call send http #{http_method} method to path defined through HTTP" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
      end

      it 'should not raise exception if data returned not in json format (should be fixed in v2)' do
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_return(StubResponse.new('Some random text here', true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
        expect(@instance.send(http_method, '/test')).to eql('Some random text here')
      end

      it "should raise Auth0::Unauthorized on send http #{http_method}
        method to path defined through HTTP when 401 status received" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, false, 401))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unauthorized)
      end

      it "should raise Auth0::NotFound on send http #{http_method} method
        to path defined through HTTP when 404 status received" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, false, 404))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::NotFound)
      end

      it "should raise Auth0::Unsupported on send http #{http_method} method
        to path defined through HTTP when 418 or other unknown status received" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, false, 418))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unsupported)
      end

      it "should raise Auth0::RequestTimeout on send http #{http_method} method
        to path defined through HTTP when RestClient::RequestTimeout received" do
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_raise(RestClient::Exceptions::OpenTimeout.new)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::RequestTimeout)
      end

      it "should raise Auth0::BadRequest on send http #{http_method} method
        to path defined through HTTP when 400 status received" do
        @exception.response = StubResponse.new({}, false, 400)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::BadRequest)
      end

      it "should raise Auth0::AccessDenied on send http #{http_method} method
        to path defined through HTTP when 403" do
        @exception.response = StubResponse.new({}, false, 403)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::AccessDenied)
      end

      it "should raise Auth0::RateLimitEncountered on send http #{http_method} method
        to path defined through HTTP when 429 recieved" do
        headers = {
          :x_ratelimit_limit     => 10,
          :x_ratelimit_remaining => 0,
          :x_ratelimit_reset     => 1560564149
        }
        @exception.response = StubResponse.new({}, false, 429, headers)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error { |error|
          expect(error).to be_a(Auth0::RateLimitEncountered)
          expect(error).to have_attributes(
            error_data: {
              headers: headers,
              code: 429
            },
            headers: headers,
            http_code: 429,
            reset: Time.at(1560564149)
          )
        }
      end

      it "should raise Auth0::ServerError on send http #{http_method} method
        to path defined through HTTP when 500 received" do
        @exception.response = StubResponse.new({}, false, 500)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::ServerError)
      end

      it 'should normalize path with Addressable::URI' do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/te%20st%23test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/te st#test') }.not_to raise_error
      end

      context "when status 429 is recieved on send http #{http_method} method" do
        it "should retry 3 times when retry_count is not set" do
          retry_instance = DummyClassForProxy.new
          retry_instance.extend(Auth0::Mixins::HTTPProxy)
          retry_instance.base_uri = "https://auth0.com"

          @exception.response = StubResponse.new({}, false, 429)
          allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
            .and_raise(@exception)
          expect(RestClient::Request).to receive(:execute).exactly(4).times

          expect { retry_instance.send(http_method, '/test') }.to raise_error { |error|
            expect(error).to be_a(Auth0::RateLimitEncountered)
          }
        end

        it "should retry 2 times when retry_count is set to 2" do
          retry_instance = DummyClassForProxy.new
          retry_instance.extend(Auth0::Mixins::HTTPProxy)
          retry_instance.base_uri = "https://auth0.com"
          retry_instance.retry_count = 2

          @exception.response = StubResponse.new({}, false, 429)
          allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
            .and_raise(@exception)
          expect(RestClient::Request).to receive(:execute).exactly(3).times

          expect { retry_instance.send(http_method, '/test') }.to raise_error { |error|
            expect(error).to be_a(Auth0::RateLimitEncountered)
          }
        end

        it "should not retry when retry_count is set to 0" do
          retry_instance = DummyClassForProxy.new
          retry_instance.extend(Auth0::Mixins::HTTPProxy)
          retry_instance.base_uri = "https://auth0.com"
          retry_instance.retry_count = 0

          @exception.response = StubResponse.new({}, false, 429)

          allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
            .and_raise(@exception)
          
          expect(RestClient::Request).to receive(:execute).exactly(1).times
          expect { retry_instance.send(http_method, '/test') }.to raise_error { |error|
            expect(error).to be_a(Auth0::RateLimitEncountered)
          }
        end

        it "should have have random retry times grow with jitter backoff" do
          retry_instance = DummyClassForProxy.new
          retry_instance.extend(Auth0::Mixins::HTTPProxy)
          retry_instance.base_uri = "https://auth0.com"
          retry_instance.retry_count = 2
          time_entries = []
          @time_start

          @exception.response = StubResponse.new({}, false, 429)
          allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                               url: 'https://auth0.com/test',
                                                               timeout: nil,
                                                               headers: { params: {} },
                                                               payload: nil) do

            time_entries.push(Time.now.to_f - @time_start.to_f)
            @time_start = Time.now.to_f # restart the clock
            raise @exception
          end

          @time_start = Time.now.to_f #start the clock
          retry_instance.send(http_method, '/test') rescue nil
          time_entries_first_set = time_entries.shift(time_entries.length)

          retry_instance.send(http_method, '/test') rescue nil
          time_entries.each_with_index do |entry, index|
            if index > 0 #skip the first request
              expect(entry != time_entries_first_set[index])
            end
          end
        end
      end
    end
  end

  %i(post put patch).each do |http_method|
    context ".#{http_method}" do
      it { expect(@instance).to respond_to(http_method.to_sym) }
      it "should call send http #{http_method} method to path defined through HTTP" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: nil,
                                                              payload: '{}')
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
      end

      it 'should not raise exception if data returned not in json format (should be fixed in v2)' do
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_return(StubResponse.new('Some random text here', true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
        expect(@instance.send(http_method, '/test')).to eql('Some random text here')
      end

      it "should raise Auth0::Unauthorized on send http #{http_method} method
        to path defined through HTTP when 401 status received" do
        @exception.response = StubResponse.new({}, false, 401)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unauthorized)
      end

      it "should raise Auth0::RateLimitEncountered on send http #{http_method} method
        to path defined through HTTP when 429 status received" do
        headers = {
          :x_ratelimit_limit     => 10,
          :x_ratelimit_remaining => 0,
          :x_ratelimit_reset     => 1560564149
        }
        @exception.response = StubResponse.new({}, false, 429,headers)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error { |error|
          expect(error).to be_a(Auth0::RateLimitEncountered)
          expect(error).to have_attributes(
            error_data: {
              headers: headers,
              code: 429
            },
            headers: headers,
            http_code: 429,
            reset: Time.at(1560564149)
          )
        }
      end

      it "should raise Auth0::NotFound on send http #{http_method} method
        to path defined through HTTP when 404 status received" do
        @exception.response = StubResponse.new({}, false, 404)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::NotFound)
      end

      it "should raise Auth0::Unsupported on send http #{http_method} method
        to path defined through HTTP when 418 or other unknown status received" do
        @exception.response = StubResponse.new({}, false, 418)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unsupported)
      end

      it "should raise Auth0::RequestTimeout on send http #{http_method} method
        to path defined through HTTP when RestClient::RequestTimeout received" do
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(RestClient::Exceptions::OpenTimeout.new)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::RequestTimeout)
      end

      it "should raise Auth0::BadRequest on send http #{http_method} method
        to path defined through HTTP when 400 status received" do
        @exception.response = StubResponse.new({}, false, 400)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::BadRequest)
      end

      it "should raise Auth0::ServerError on send http #{http_method} method
        to path defined through HTTP when 500 received" do
        @exception.response = StubResponse.new({}, false, 500)
        allow(RestClient::Request).to receive(:execute).with(method: http_method, url: 'https://auth0.com/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::ServerError)
      end

      it 'should normalize path with Addressable::URI' do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/te%20st',
                                                              timeout: nil,
                                                              headers: nil,
                                                              payload: '{}')
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/te st') }.not_to raise_error
      end

      it 'should give the JSON representation of the error as the error message' do
        res = JSON.generate('statusCode' => 404,
                            'error' => 'Bad Request',
                            'message' => "Path validation error: 'String does not match pattern ^.+\\|.+$:
                                            3241312' on property id (The user_id of the user to retrieve).",
                            'errorCode' => 'invalid_uri')
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: nil,
                                                              payload: '{}')
          .and_return(StubResponse.new(res, true, 404))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::NotFound, res)
      end

      context "when status 429 is recieved on send http #{http_method} method" do
        it "should retry 3 times when retry_count is not set" do
          retry_instance = DummyClassForProxy.new
          retry_instance.extend(Auth0::Mixins::HTTPProxy)
          retry_instance.base_uri = "https://auth0.com"

          @exception.response = StubResponse.new({}, false, 429)
          allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: nil,
                                                              payload: '{}')
            .and_raise(@exception)
          expect(RestClient::Request).to receive(:execute).exactly(4).times

          expect { retry_instance.send(http_method, '/test') }.to raise_error { |error|
            expect(error).to be_a(Auth0::RateLimitEncountered)
          }
        end

        it "should retry 2 times when retry_count is set to 2" do
          retry_instance = DummyClassForProxy.new
          retry_instance.extend(Auth0::Mixins::HTTPProxy)
          retry_instance.base_uri = "https://auth0.com"
          retry_instance.retry_count = 2

          @exception.response = StubResponse.new({}, false, 429)
          allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: nil,
                                                              payload: '{}')
            .and_raise(@exception)
          expect(RestClient::Request).to receive(:execute).exactly(3).times

          expect { retry_instance.send(http_method, '/test') }.to raise_error { |error|
            expect(error).to be_a(Auth0::RateLimitEncountered)
          }
        end

        it "should not retry when retry_count is set to 0" do
          retry_instance = DummyClassForProxy.new
          retry_instance.extend(Auth0::Mixins::HTTPProxy)
          retry_instance.base_uri = "https://auth0.com"
          retry_instance.retry_count = 0

          @exception.response = StubResponse.new({}, false, 429)

          allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: 'https://auth0.com/test',
                                                              timeout: nil,
                                                              headers: nil,
                                                              payload: '{}')
            .and_raise(@exception)
          
          expect(RestClient::Request).to receive(:execute).exactly(1).times
          expect { retry_instance.send(http_method, '/test') }.to raise_error { |error|
            expect(error).to be_a(Auth0::RateLimitEncountered)
          }
        end

        it "should have have random retry times grow with jitter backoff" do
          retry_instance = DummyClassForProxy.new
          retry_instance.extend(Auth0::Mixins::HTTPProxy)
          retry_instance.base_uri = "https://auth0.com"
          retry_instance.retry_count = 2
          time_entries = []
          @time_start

          @exception.response = StubResponse.new({}, false, 429)
          allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                               url: 'https://auth0.com/test',
                                                               timeout: nil,
                                                               headers: nil,
                                                               payload: '{}') do

            time_entries.push(Time.now.to_f - @time_start.to_f)
            @time_start = Time.now.to_f # restart the clock
            raise @exception
          end

          @time_start = Time.now.to_f #start the clock
          retry_instance.send(http_method, '/test') rescue nil
          time_entries_first_set = time_entries.shift(time_entries.length)

          retry_instance.send(http_method, '/test') rescue nil
          time_entries.each_with_index do |entry, index|
            if index > 0 #skip the first request
              expect(entry != time_entries_first_set[index])
            end
          end
        end
      end
    end
  end

  context "Renewing tokens" do
    let(:httpproxy_instance) {
      DummyClassForTokens.new(
        client_id: 'test-client-id',
        client_secret: 'test-client-secret',
        domain: 'auth0.com',
      )
    }

    %i(get delete).each do |http_method|
      context "for #{http_method}" do
        it 'should renew the token' do
          expect(RestClient::Request).to receive(:execute).with(hash_including(
            method: :post,
            url: 'https://auth0.com/oauth/token',
          )).and_return(StubResponse.new({ 
            "access_token" => "access_token", 
            "expires_in" => 86400}, 
            true, 
            200))

          expect(RestClient::Request).to receive(:execute).with(hash_including(
            method: http_method,
            url: 'https://auth0.com/test'
          )).and_return(StubResponse.new('Some random text here', true, 200))

          expect { httpproxy_instance.send(http_method, '/test') }.not_to raise_error
        end
      end
    end

    %i(post put patch).each do |http_method|
      context "for #{http_method}" do
        it 'should renew the token' do
          expect(RestClient::Request).to receive(:execute).with(hash_including(
            method: :post,
            url: 'https://auth0.com/oauth/token',
          ) ).and_return(StubResponse.new({ 
            "access_token" => "access_token", 
            "expires_in" => 86400}, 
            true, 
            200))

          expect(RestClient::Request).to receive(:execute).with(hash_including(
            method: http_method,
            url: 'https://auth0.com/test',
            headers: hash_including( "Authorization" => "Bearer access_token")
          )).and_return(StubResponse.new('Some random text here', true, 200))

          expect { httpproxy_instance.send(http_method, '/test') }.not_to raise_error
        end
      end
    end
  end

  context "Using cached tokens" do
    let(:httpproxy_instance) {
      DummyClassForTokens.new(
        client_id: 'test-client-id',
        client_secret: 'test-client-secret',
        domain: 'auth0.com',
        token: 'access_token',
        token_expires_at: Time.now.to_i + 86400)
    }

    %i(get delete).each do |http_method|
      context "for #{http_method}" do
        it 'should use the cached token' do
          expect(RestClient::Request).not_to receive(:execute).with(hash_including(
            method: :post,
            url: 'https://auth0.com/oauth/token',
          ))

          expect(RestClient::Request).to receive(:execute).with(hash_including(
            method: http_method,
            url: 'https://auth0.com/test',
            headers: hash_including(params: {}, "Authorization" => "Bearer access_token")
          )).and_return(StubResponse.new('Some random text here', true, 200))

          expect { httpproxy_instance.send(http_method, '/test') }.not_to raise_error
        end
      end
    end

    %i(post put patch).each do |http_method|
      context "for #{http_method}" do
        it 'should use the cached token' do
          expect(RestClient::Request).not_to receive(:execute).with(hash_including(
            method: :post,
            url: 'https://auth0.com/oauth/token',
          ))

          expect(RestClient::Request).to receive(:execute).with(hash_including(
            method: http_method,
            url: 'https://auth0.com/test',
            headers: hash_including("Authorization" => "Bearer access_token")
          )).and_return(StubResponse.new('Some random text here', true, 200))

          expect { httpproxy_instance.send(http_method, '/test') }.not_to raise_error
        end
      end
    end
  end

  context 'Normal operation' do
    let(:httpproxy_instance) {
      DummyClassForTokens.new(
        client_id: 'test-client-id',
        client_secret: 'test-client-secret',
        domain: 'auth0.com',
        token: 'access_token',
        token_expires_at: Time.now.to_i + 86400)
    }

    # This sets up a test matrix to verify that both :get and :delete calls (the only two HTTP methods in the proxy that mutated headers)
    # don't bleed query params into subsequent calls to :post :patch and :put.
    %i(get delete).each do |modifying_method|
      %i(post patch put).each do |affected_method|
        it "should not bleed :#{modifying_method} headers/parameters to the subsequent :#{affected_method} request" do
          expect(RestClient::Request).to receive(:execute).with(hash_including(
            method: modifying_method,
            url: 'https://auth0.com/test',
            headers: hash_including(params: { email: 'test@test.com' })
          )).and_return(StubResponse.new('OK', true, 200))

          # email: parameter that is sent in the GET request should not appear
          # as a parameter in the `headers` hash for the subsequent PATCH request.
          expect(RestClient::Request).to receive(:execute).with(hash_including(
            method: affected_method,
            url: 'https://auth0.com/test-patch',
            headers: hash_not_including(:params)
          )).and_return(StubResponse.new('OK', true, 200))

          expect { httpproxy_instance.send(modifying_method, '/test', { email: 'test@test.com' }) }.not_to raise_error
          expect { httpproxy_instance.send(affected_method, '/test-patch') }.not_to raise_error
        end
      end
    end
  end
end

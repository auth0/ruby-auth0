require 'json'
require 'spec_helper'

describe Auth0::Mixins::HTTPProxy do
  before :each do
    dummy_instance = DummyClassForProxy.new
    dummy_instance.extend(Auth0::Mixins::HTTPProxy)
    @instance = dummy_instance
    @exception = DummyClassForRestClient.new
  end

  %i(get delete).each do |http_method|
    context ".#{http_method}" do
      it { expect(@instance).to respond_to(http_method.to_sym) }
      it "should call send http #{http_method} method to path defined through HTTP" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: '/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
      end

      it 'should not raise exception if data returned not in json format (should be fixed in v2)' do
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: '/test',
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
                                                              url: '/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, false, 401))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unauthorized)
      end

      it "should raise Auth0::NotFound on send http #{http_method} method
        to path defined through HTTP when 404 status received" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: '/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, false, 404))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::NotFound)
      end

      it "should raise Auth0::Unsupported on send http #{http_method} method
        to path defined through HTTP when 418 or other unknown status received" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: '/test',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, false, 418))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unsupported)
      end

      it "should raise Auth0::BadRequest on send http #{http_method} method
        to path defined through HTTP when 400 or other unknown status received" do
        @exception.response = StubResponse.new({}, false, 400)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: '/test',
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
                                                             url: '/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::AccessDenied)
      end

      it "should raise Auth0::RateLimitEncountered on send http #{http_method} method
        to path defined through HTTP when 429 recieved" do
        headers = {
          'X-RateLimit-Limit'     => 10,
          'X-RateLimit-Remaining' => 0,
          'X-RateLimit-Reset'     => 1560564149
        }
        @exception.response = StubResponse.new({}, false, 429, headers)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: '/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error { |error|
          expect(error).to be_a(Auth0::RateLimitEncountered)
          expect(error).to have_attributes(limit: 10, remaining: 0, reset: 1560564149)
        }
      end      

      it "should raise Auth0::ServerError on send http #{http_method} method
        to path defined through HTTP when 500 received" do
        @exception.response = StubResponse.new({}, false, 500)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: '/test',
                                                             timeout: nil,
                                                             headers: { params: {} },
                                                             payload: nil)
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::ServerError)
      end

      it 'should escape path with URI.escape' do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: '/te%20st',
                                                              timeout: nil,
                                                              headers: { params: {} },
                                                              payload: nil)
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/te st') }.not_to raise_error
      end
    end
  end

  %i(post put patch).each do |http_method|
    context ".#{http_method}" do
      it { expect(@instance).to respond_to(http_method.to_sym) }
      it "should call send http #{http_method} method to path defined through HTTP" do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: '/test',
                                                              timeout: nil,
                                                              headers: nil,
                                                              payload: '{}')
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
      end

      it 'should not raise exception if data returned not in json format (should be fixed in v2)' do
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: '/test',
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
                                                             url: '/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unauthorized)
      end
      
      it "should raise Auth0::RateLimitEncountered on send http #{http_method} method
        to path defined through HTTP when 429 status received" do
        headers = {
          'X-RateLimit-Limit'     => 10,
          'X-RateLimit-Remaining' => 0,
          'X-RateLimit-Reset'     => 1560564149
        }
        @exception.response = StubResponse.new({}, false, 429,headers)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: '/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error { |error|
          expect(error).to be_a(Auth0::RateLimitEncountered)
          expect(error).to have_attributes(limit: 10, remaining: 0, reset: 1560564149)
        }
      end

      it "should raise Auth0::NotFound on send http #{http_method} method
        to path defined through HTTP when 404 status received" do
        @exception.response = StubResponse.new({}, false, 404)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: '/test',
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
                                                             url: '/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unsupported)
      end

      it "should raise Auth0::BadRequest on send http #{http_method} method
        to path defined through HTTP when 400 or other unknown status received" do
        @exception.response = StubResponse.new({}, false, 400)
        allow(RestClient::Request).to receive(:execute).with(method: http_method,
                                                             url: '/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::BadRequest)
      end

      it "should raise Auth0::ServerError on send http #{http_method} method
        to path defined through HTTP when 500 received" do
        @exception.response = StubResponse.new({}, false, 500)
        allow(RestClient::Request).to receive(:execute).with(method: http_method, url: '/test',
                                                             timeout: nil,
                                                             headers: nil,
                                                             payload: '{}')
          .and_raise(@exception)
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::ServerError)
      end

      it 'should escape path with URI.escape' do
        expect(RestClient::Request).to receive(:execute).with(method: http_method,
                                                              url: '/te%20st',
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
                                                              url: '/test',
                                                              timeout: nil,
                                                              headers: nil,
                                                              payload: '{}')
          .and_return(StubResponse.new(res, true, 404))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::NotFound, res)
      end
    end
  end
end

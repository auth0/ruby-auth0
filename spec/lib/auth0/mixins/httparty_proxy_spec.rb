require 'json'
require 'spec_helper'

describe Auth0::Mixins::HTTPartyProxy do
  before :all do
    dummy_instance = DummyClassForProxy.new
    dummy_instance.extend(Auth0::Mixins::HTTPartyProxy)
    @instance = dummy_instance
  end

  %i(get).each do |http_method|
    context ".#{http_method}" do
      it { expect(@instance).to respond_to(http_method.to_sym) }
      it "should call send http #{http_method} method to path defined through HTTParty" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', query: {})
        expect(DummyClassForProxy).to receive(http_method).with('/test', query: {})
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
      end

      it 'should not raise exception if data returned not in json format (should be fixed in v2)' do
        allow(DummyClassForProxy).to receive(http_method).with('/test', query: {})
          .and_return(StubResponse.new('Some random text here', true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
        expect(@instance.send(http_method, '/test')).to eql('Some random text here')
      end

      it "should raise Auth0::Unauthorized on send http #{http_method}
        method to path defined through HTTParty when 401 status received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', query: {})
        expect(DummyClassForProxy).to receive(http_method).with('/test', query: {})
          .and_return(StubResponse.new({}, false, 401))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unauthorized)
      end

      it "should raise Auth0::NotFound on send http #{http_method} method
        to path defined through HTTParty when 404 status received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', query: {})
        expect(DummyClassForProxy).to receive(http_method).with('/test', query: {})
          .and_return(StubResponse.new({}, false, 404))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::NotFound)
      end

      it "should raise Auth0::Unsupported on send http #{http_method} method
        to path defined through HTTParty when 418 or other unknown status received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', query: {})
        expect(DummyClassForProxy).to receive(http_method).with('/test', query: {})
          .and_return(StubResponse.new({}, false, 418))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unsupported)
      end

      it "should raise Auth0::BadRequest on send http #{http_method} method
        to path defined through HTTParty when 400 or other unknown status received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', query: {})
        expect(DummyClassForProxy).to receive(http_method).with('/test', query: {})
          .and_return(StubResponse.new({}, false, 400))
        expect { @instance.send(http_method, '/test') }.to raise_error(
          Auth0::BadRequest)
      end

      it "should raise Auth0::AccessDenied on send http #{http_method} method
        to path defined through HTTParty when 403" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', query: {})
        expect(DummyClassForProxy).to receive(http_method).with('/test', query: {})
          .and_return(StubResponse.new({}, false, 403))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::AccessDenied)
      end
      it "should raise Auth0::ServerError on send http #{http_method} method
        to path defined through HTTParty when 500 received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', query: {})
        expect(DummyClassForProxy).to receive(http_method).with('/test', query: {})
          .and_return(StubResponse.new({}, false, 500))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::ServerError)
      end

      it 'should escape path with URI.escape' do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/te%20st', query: {})
        expect(DummyClassForProxy).to receive(http_method).with('/te%20st', query: {})
          .and_return(StubResponse.new({}, true, 200))
        expect { @instance.send(http_method, '/te st') }.not_to raise_error
      end
    end
  end

  %i(post put patch delete).each do |http_method|
    context ".#{http_method}" do
      it { expect(@instance).to respond_to(http_method.to_sym) }
      it "should call send http #{http_method} method to path defined through HTTParty" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', body: '{}')
        expect(DummyClassForProxy).to receive(http_method).with('/test', body: '{}')
          .and_return(StubResponse.new('{}', true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
      end

      it 'should not raise exception if data returned not in json format (should be fixed in v2)' do
        allow(DummyClassForProxy).to receive(http_method).with('/test', body: '{}')
          .and_return(StubResponse.new('Some random text here', true, 200))
        expect { @instance.send(http_method, '/test') }.not_to raise_error
        expect(@instance.send(http_method, '/test')).to eql('Some random text here')
      end

      it "should raise Auth0::Unauthorized on send http #{http_method} method
        to path defined through HTTParty when 401 status received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', body: '{}')
        expect(DummyClassForProxy).to receive(http_method).with('/test', body: '{}')
          .and_return(StubResponse.new('{}', false, 401))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unauthorized)
      end

      it "should raise Auth0::NotFound on send http #{http_method} method
        to path defined through HTTParty when 404 status received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', body: '{}')
        expect(DummyClassForProxy).to receive(http_method).with('/test', body: '{}')
          .and_return(StubResponse.new('{}', false, 404))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::NotFound)
      end

      it "should raise Auth0::Unsupported on send http #{http_method} method
        to path defined through HTTParty when 418 or other unknown status received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', body: '{}')
        expect(DummyClassForProxy).to receive(http_method).with('/test', body: '{}')
          .and_return(StubResponse.new('{}', false, 418))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::Unsupported)
      end

      it "should raise Auth0::BadRequest on send http #{http_method} method
        to path defined through HTTParty when 400 or other unknown status received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', body: '{}')
        expect(DummyClassForProxy).to receive(http_method).with('/test', body: '{}')
          .and_return(StubResponse.new('{}', false, 400))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::BadRequest)
      end

      it "should raise Auth0::ServerError on send http #{http_method} method
        to path defined through HTTParty when 500 received" do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', body: '{}')
        expect(DummyClassForProxy).to receive(http_method).with('/test', body: '{}')
          .and_return(StubResponse.new('{}', false, 500))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::ServerError)
      end

      it 'should escape path with URI.escape' do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/te%20st', body: '{}')
        expect(DummyClassForProxy).to receive(http_method).with('/te%20st', body: '{}')
          .and_return(StubResponse.new('{}', true, 200))
        expect { @instance.send(http_method, '/te st') }.not_to raise_error
      end

      it 'should give the JSON representation of the error as the error message' do
        allow(DummyClassForProxy).to receive(http_method).with('http://login.auth0.com/test', body: '{}')
        res = JSON.generate('statusCode' => 404,
                            'error' => 'Bad Request',
                            'message' => "Path validation error: 'String does not match pattern ^.+\\|.+$:
                                            3241312' on property id (The user_id of the user to retrieve).",
                            'errorCode' => 'invalid_uri')
        expect(DummyClassForProxy).to receive(http_method).with('/test', body: '{}')
          .and_return(StubResponse.new(res, false, 404))
        expect { @instance.send(http_method, '/test') }.to raise_error(Auth0::NotFound, res)
      end
    end
  end
end

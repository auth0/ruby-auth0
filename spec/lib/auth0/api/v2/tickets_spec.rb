require 'spec_helper'
describe Auth0::Api::V2::Tickets do
  before :all do
    @instance = DummyClass.new.extend(Auth0::Api::V2::Tickets)
  end

  context '.post_email_verification' do
    it { expect(@instance).to respond_to(:post_email_verification) }
    it 'expect client to send post to /api/v2/tickets/email-verification with body' do
      expect(@instance).to receive(:post).with('/api/v2/tickets/email-verification', 'test body')
      expect { @instance.post_email_verification('test body') }.not_to raise_error
    end
    it 'expect client to rasie error when calling with empty body' do
      expect { @instance.post_email_verification(nil) }.to raise_error(
        'Must supply a valid body to post an email verification')
    end
  end
  context '.post_password_change' do
    it { expect(@instance).to respond_to(:post_password_change) }
    it 'expect client to send post to /api/v2/tickets/password-change with body' do
      expect(@instance).to receive(:post).with('/api/v2/tickets/password-change', 'test body')
      expect { @instance.post_password_change('test body') }.not_to raise_error
    end
    it 'expect client to rasie error when calling with empty body' do
      expect { @instance.post_password_change(nil) }.to raise_error 'Must supply a valid body to post a password-change'
    end
  end
end

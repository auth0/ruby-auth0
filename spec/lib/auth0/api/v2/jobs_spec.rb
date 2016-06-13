require 'spec_helper'
describe Auth0::Api::V2::Jobs do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Jobs)
    @instance = dummy_instance
  end
  context '.get_job' do
    it { expect(@instance).to respond_to(:get_job) }
    it 'expect client to send get to /api/v2/stats/jobs/3' do
      expect(@instance).to receive(:get).with('/api/v2/jobs/3')
      expect { @instance.get_job(3) }.not_to raise_error
    end
    it { expect { @instance.get_job('') }.to raise_error('Must specify a job id') }
  end
  context '.import_users' do
    it { expect(@instance).to respond_to(:import_users) }
    it 'expect client to send post to /api/v2/jobs/users-imports' do
      expect(@instance).to receive(:post_file).with(
        '/api/v2/jobs/users-imports', users: 'file', connection_id: 'connnection_id'
      )
      expect { @instance.import_users('file', 'connnection_id') }.not_to raise_error
    end
    it { expect { @instance.import_users('', 'connnection_id') }.to raise_error('Must specify a valid file') }
    it { expect { @instance.import_users('users', '') }.to raise_error('Must specify a connection_id') }
  end

  context '.send_verification_email' do
    it { expect(@instance).to respond_to(:send_verification_email) }
    it 'expect client to send post to /api/v2/jobs/verification-email' do
      expect(@instance).to receive(:post).with('/api/v2/jobs/verification-email', user_id: 'user_id')
      expect { @instance.send_verification_email('user_id') }.not_to raise_error
    end
    it { expect { @instance.send_verification_email('') }.to raise_error('Must specify a user id') }
  end
end

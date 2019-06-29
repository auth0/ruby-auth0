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
  context '.get_job_errors' do
    it { expect(@instance).to respond_to(:get_job_errors) }
    it 'expect client to send get to /api/v2/jobs/3/errors' do
      expect(@instance).to receive(:get).with('/api/v2/jobs/3/errors')
      expect { @instance.get_job_errors(3) }.not_to raise_error
    end
    it { expect { @instance.get_job_errors('') }.to raise_error('Must specify a job id') }
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
  context '.export_users' do
    it { expect(@instance).to respond_to(:export_users) }
    it { expect { @instance.export_users }.not_to raise_error }
    it 'sends post to /api/v2/jobs/users-exports with correct params' do
      expect(@instance).to receive(:post).with(
        '/api/v2/jobs/users-exports',
        fields: [{ name: 'author' }],
        connection_id: 'test-connection',
        format: 'csv',
        limit: 10
      )
      @instance.export_users(
        fields: ['author'],
        connection_id: 'test-connection',
        format: 'csv',
        limit: 10
      )
    end
  end

  context '.send_verification_email' do
    it 'should respond to a send_verification_email method' do
      expect(@instance).to respond_to(:send_verification_email)
    end

    it 'should post to the jobs email verification endpoint' do
      expect(@instance).to receive(:post).with(
        '/api/v2/jobs/verification-email',
        user_id: 'test_user_id'
      )
      expect do
        @instance.send_verification_email('test_user_id')
      end.not_to raise_error
    end

    it 'should post to the jobs email verification endpoint with a client_id' do
      expect(@instance).to receive(:post).with(
        '/api/v2/jobs/verification-email',
        user_id: 'test_user_id',
        client_id: 'test_client_id'
      )
      expect do
        @instance.send_verification_email('test_user_id', 'test_client_id')
      end.not_to raise_error
    end

    it 'should raise an error if the user_id is empty' do
      expect do
        @instance.send_verification_email('')
      end.to raise_error('Must specify a user id')
    end
  end
end

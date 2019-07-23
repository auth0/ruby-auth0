require 'spec_helper'
describe Auth0::Api::V2::Guardian do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Guardian)
    @instance = dummy_instance
  end

  context '.guardian_factors' do
    it 'is expected to respond to a guardian_factors method' do
      expect(@instance).to respond_to(:guardian_factors)
    end

    it 'is expected to respond to a get_guardian_factors method' do
      expect(@instance).to respond_to(:get_guardian_factors)
    end

    it 'is expected to get /api/v2/guardian/factors' do
      expect(@instance).to receive(:get).with(
        '/api/v2/guardian/factors'
      )
      expect { @instance.guardian_factors }.not_to raise_error
    end
  end

  context '.guardian_enrollment' do
    it 'is expected to respond to a guardian_enrollment method' do
      expect(@instance).to respond_to(:guardian_enrollment)
    end

    it 'is expected to call get request to /api/v2/guardian/enrollments/ENROLLMENT_ID' do
      expect(@instance).to receive(:get).with(
        '/api/v2/guardian/enrollments/ENROLLMENT_ID'
      )
      expect { @instance.guardian_enrollment('ENROLLMENT_ID') }.not_to raise_error
    end

    it 'is expected to raise an exception when the enrollment ID is empty' do
      expect { @instance.guardian_enrollment(nil) }.to raise_exception(Auth0::MissingParameter)
    end
  end

  context '.delete_user' do
    it 'is expected to respond to a delete_guardian_enrollment method' do
      expect(@instance).to respond_to(:delete_guardian_enrollment)
    end

    it 'is expected to delete /api/v2/guardian/enrollments/ENROLLMENT_ID' do
      expect(@instance).to receive(:delete).with('/api/v2/guardian/enrollments/ENROLLMENT_ID')
      @instance.delete_guardian_enrollment('ENROLLMENT_ID')
    end

    it 'is expected not to delete /api/v2/guardian/enrollments/ENROLLMENT_ID if enrollment_id is blank' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_guardian_enrollment(nil) }.to raise_exception(
        Auth0::MissingParameter
      )
    end
  end
end

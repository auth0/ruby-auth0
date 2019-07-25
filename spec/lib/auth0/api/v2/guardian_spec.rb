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

  context '.delete_guardian_enrollment' do
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

  context '.guardian_sms_templates' do
    it 'is expected to respond to a guardian_sms_templates method' do
      expect(@instance).to respond_to(:guardian_sms_templates)
    end

    it 'is expected to call get request to /api/v2/guardian/factors/sms/templates' do
      expect(@instance).to receive(:get).with(
        '/api/v2/guardian/factors/sms/templates'
      )
      expect { @instance.guardian_sms_templates }.not_to raise_error
    end
  end

  context '.guardian_update_enrollment_verification_templates' do
    it 'is expected to respond to a guardian_update_enrollment_verification_templates method' do
      expect(@instance).to respond_to(:guardian_update_enrollment_verification_templates)
    end

    it 'is expected to patch /api/v2/guardian/factors/sms/templates' do
      expect(@instance).to receive(:patch).with('/api/v2/guardian/factors/sms/templates', 'BODY')
      @instance.guardian_update_enrollment_verification_templates('BODY')
    end
  end

  context '.guardian_sns_provider_config' do
    it 'is expected to respond to a guardian_sns_provider_config method' do
      expect(@instance).to respond_to(:guardian_sns_provider_config)
    end

    it 'is expected to call get request to /api/v2/guardian/factors/push-notification/providers/sns' do
      expect(@instance).to receive(:get).with(
        '/api/v2/guardian/factors/push-notification/providers/sns'
      )
      expect { @instance.guardian_sns_provider_config }.not_to raise_error
    end
  end

  context '.guardian_update_sns_provider_config' do
    it 'is expected to respond to a guardian_update_sns_provider_config method' do
      expect(@instance).to respond_to(:guardian_update_sns_provider_config)
    end

    it 'is expected to patch /api/v2/guardian/factors/push-notification/providers/sns' do
      expect(@instance).to receive(:patch).with('/api/v2/guardian/factors/push-notification/providers/sns', 'BODY')
      @instance.guardian_update_sns_provider_config('BODY')
    end
  end

  context '.guardian_twillo_provider_config' do
    it 'is expected to respond to a guardian_twillo_provider_config method' do
      expect(@instance).to respond_to(:guardian_twillo_provider_config)
    end

    it 'is expected to call get request to /api/v2/guardian/factors/sms/providers/twilio' do
      expect(@instance).to receive(:get).with(
        '/api/v2/guardian/factors/sms/providers/twilio'
      )
      expect { @instance.guardian_twillo_provider_config }.not_to raise_error
    end
  end

  context '.guardian_update_twillo_provider_config' do
    it 'is expected to respond to a guardian_update_twillo_provider_config method' do
      expect(@instance).to respond_to(:guardian_update_twillo_provider_config)
    end

    it 'is expected to patch /api/v2/guardian/factors/sms/providers/twilio' do
      expect(@instance).to receive(:patch).with('/api/v2/guardian/factors/sms/providers/twilio', 'BODY')
      @instance.guardian_update_twillo_provider_config('BODY')
    end
  end

  context '.guardian_create_enrollment_ticket' do
    it 'is expected to respond to a guardian_create_enrollment_ticket method' do
      expect(@instance).to respond_to(:guardian_create_enrollment_ticket)
    end

    it 'is expected to post /api/v2/guardian/enrollments/ticket' do
      expect(@instance).to receive(:post).with('/api/v2/guardian/enrollments/ticket', 'BODY')
      @instance.guardian_create_enrollment_ticket('BODY')
    end
  end

  context '.guardian_update_factor' do
    it 'is expected to respond to a guardian_update_factor method' do
      expect(@instance).to respond_to(:guardian_update_factor)
    end

    it 'is expected to patch /api/v2/guardian/factors/NAME' do
      expect(@instance).to receive(:patch).with('/api/v2/guardian/factors/NAME', 'BODY')
      @instance.guardian_update_factor('NAME', 'BODY')
    end
  end
end

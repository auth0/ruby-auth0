require 'spec_helper'
describe Auth0::Api::V2::Prompts do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Prompts)
    @instance = dummy_instance
  end

  context '.prompts' do
    it 'is expected to respond to a prompts method' do
      expect(@instance).to respond_to(:prompts)
    end

    it 'is expected to respond to a get_prompts method' do
      expect(@instance).to respond_to(:get_prompts)
    end

    it 'is expected to get /api/v2/prompts' do
      expect(@instance).to receive(:get).with('/api/v2/prompts')

      expect { @instance.prompts }.not_to raise_error
    end
  end

  context '.update_prompts' do
    it 'is expected to respond to a prompts method' do
      expect(@instance).to respond_to(:update_prompts)
    end

    it 'is expected to respond to a get_prompts method' do
      expect(@instance).to respond_to(:patch_prompts)
    end

    it 'is expected to call patch /api/v2/prompts' do
      expect(@instance).to receive(:patch).with('/api/v2/prompts', { universal_login_experience: 'new' })

      expect { @instance.update_prompts(universal_login_experience: 'new') }.not_to raise_error
    end
  end

  context '.custom_text' do
    it 'is expected to respond to a prompts method' do
      expect(@instance).to respond_to(:custom_text)
    end

    it 'is expected to respond to a get_prompts method' do
      expect(@instance).to respond_to(:get_custom_text)
    end

    it 'is expected to get /api/v2/prompts/PROMPT_NAME/language/LANGUAGE' do
      expect(@instance).to receive(:get).with('/api/v2/prompts/PROMPT_NAME/custom-text/LANGUAGE')

      expect { @instance.custom_text('PROMPT_NAME', 'LANGUAGE') }.not_to raise_error
    end

    it 'is expected to raise an exception when the prompt is empty' do
      expect { @instance.custom_text(nil, nil) }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to raise an exception when the prompt is empty' do
      expect { @instance.custom_text('prompt_name', nil) }.to raise_exception(Auth0::InvalidParameter)
    end
  end

  context '.update_custom_text' do
    it 'is expected to respond to a prompts method' do
      expect(@instance).to respond_to(:update_custom_text)
    end

    it 'is expected to respond to a get_prompts method' do
      expect(@instance).to respond_to(:put_custom_text)
    end

    it 'is expected to get /api/v2/prompts/PROMPT_NAME/language/LANGUAGE' do
      expect(@instance).to receive(:put).with('/api/v2/prompts/PROMPT_NAME/custom-text/LANGUAGE', 'BODY')

      expect { @instance.update_custom_text('PROMPT_NAME', 'LANGUAGE', 'BODY') }.not_to raise_error
    end

    it 'is expected to raise an exception when the prompt is empty' do
      expect { @instance.update_custom_text(nil, nil, 'BODY') }.to raise_exception(Auth0::InvalidParameter)
    end

    it 'is expected to raise an exception when the prompt is empty' do
      expect { @instance.update_custom_text('prompt_name', nil, 'BODY') }.to raise_exception(Auth0::InvalidParameter)
    end
  end
end

require 'spec_helper'
describe Auth0::Api::V2::Rules do
  attr_reader :client, :test_script, :enabled_rule, :disabled_rule

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    @test_script = 'function (user, context, cb) { cb(null, user, context);}'

    VCR.use_cassette('Auth0_Api_V2_Rules/create_test_enabled_rule') do
      @enabled_rule = client.create_rule(
        "#{entity_suffix} - ENABLED",
        test_script
      )
    end

    VCR.use_cassette('Auth0_Api_V2_Rules/create_test_disabled_rule') do
      @disabled_rule = client.create_rule(
        "#{entity_suffix} - DISABLED",
        test_script,
        nil,
        false
      )
    end
  end

  after(:all) do
    VCR.use_cassette('Auth0_Api_V2_Logs/delete_test_enabled_rule') do
      client.delete_rule(disabled_rule['id'])
    end
    VCR.use_cassette('Auth0_Api_V2_Logs/delete_test_disabled_rule') do
      client.delete_rule(disabled_rule['id'])
    end
  end

  describe '.create_rule', vcr: true do
    it 'should create the test enabled rule with the correct attributes' do
      expect(enabled_rule).to(
        include(
          'name' => "#{entity_suffix} - ENABLED",
          'stage' => 'login_success',
          'script' => test_script,
          'enabled' => true
        )
      )
    end

    it 'should create the test disabled rule with the correct attributes' do
      expect(disabled_rule).to(
        include(
          'name' => "#{entity_suffix} - DISABLED",
          'stage' => 'login_success',
          'script' => test_script,
          'enabled' => false
        )
      )
    end

    it 'should raise an error if the name is empty' do
      expect do
        client.create_rule('', 'SCRIPT')
      end.to raise_error(Auth0::InvalidParameter)
    end

    it 'should raise an error if the name is empty' do
      expect do
        client.create_rule('NAME', '')
      end.to raise_error(Auth0::InvalidParameter)
    end
  end

  describe '.rules', vcr: true do
    let(:rules) do
      client.rules
    end

    it 'should return at least 1 rule' do
      expect(rules.size).to be > 0
    end

    context '#filters' do
      it 'should return at least 1 enabled rule' do
        expect(client.rules(enabled: true).size).to be >= 1
      end

      it 'should return at least 1 disabled rule' do
        expect(client.rules(enabled: false).size).to be >= 1
      end

      it 'should include the specified fields' do
        expect(
          client.rules(
            fields: %i[script order].join(',')
          ).first
        ).to(include('script', 'order'))
      end

      it 'should exclude fields not specified' do
        expect(
          client.rules(
            fields: [:script].join(',')
          ).first
        ).to_not(include('order', 'name'))
      end

      it 'should return paginated results' do
        rule_1 = client.rules(fields: :name, page: 0, per_page: 2)
        rule_2 = client.rules(fields: :name, page: 1, per_page: 1)
        expect(rule_1.last).to eq(rule_2.first)
      end
    end
  end

  describe '.rule', vcr: true do
    it 'should get a specific rule' do
      expect(client.rule(enabled_rule['id'])).to(
        include(
          'name' => enabled_rule['name'],
          'script' => enabled_rule['script']
        )
      )
    end

    context '#filters' do
      let(:rule_include) do
        client.rule(
          enabled_rule['id'],
          fields: %i[stage order script].join(',')
        )
      end

      let(:rule_not_include) do
        client.rule(
          enabled_rule['id'],
          fields: :stage,
          include_fields: false
        )
      end

      it 'should include the specified fields' do
        expect(rule_include).to(include('stage', 'order', 'script'))
      end

      it 'should exclude the specified fields' do
        expect(rule_not_include).to(include('order', 'script'))
      end

      it 'should exclude the fields not specified' do
        expect(rule_not_include).to_not(include('stage'))
      end
    end
  end

  describe '.update_rule', vcr: true do
    it 'should update the disabled rule to be enabled' do
      expect(
        client.update_rule(
          disabled_rule['id'],
          enabled: true
        )
      ).to(include('enabled' => true))
    end
  end

  describe '.delete_rule', vcr: true do
    it 'should raise an error if the rule ID is not passed' do
      expect { client.delete_rule '' }.to raise_error(Auth0::InvalidParameter)
    end

    it 'should delete the test enabled rule without an error' do
      expect { client.delete_rule(enabled_rule['id']) }.to_not raise_error
    end

    it 'should delete the test disabled rule without an error' do
      expect { client.delete_rule(disabled_rule['id']) }.to_not raise_error
    end
  end
end

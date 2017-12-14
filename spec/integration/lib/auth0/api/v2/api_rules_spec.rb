require 'spec_helper'
describe Auth0::Api::V2::Rules do
  attr_reader :client, :enabled_rule, :disabled_rule

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    suffix = Faker::Lorem.word
    script = 'function (user, context, callback) { callback(null, user, context);}'
    stage = 'login_success'
    sleep 1
    @enabled_rule = client.create_rule("Enabled Rule #{suffix}", script, rand(1..10), true, stage)
    sleep 1
    @disabled_rule = client.create_rule("Disabled Rule #{suffix}", script, rand(11..20), false, stage)
  end

  after(:all) do
    rules = client.rules
    rules.each do |rule|
      sleep 1
      client.delete_rule(rule['id'])
    end
  end

  describe '.rules' do
    let(:rules) do
      sleep 1
      client.rules
    end

    it do
      sleep 1
      expect(rules.size).to be > 0
    end

    context '#filters' do
      it do
        sleep 1
        expect(client.rules(enabled: true).size).to be 1
      end

      it do
        sleep 1
        expect(client.rules(enabled: false).size).to be 1
      end

      it do
        sleep 1
        expect(client.rules(enabled: true, fields: [:script, :order].join(',')).first).to(include('script', 'order'))
      end
      it do
        sleep 1
        expect(client.rules(enabled: true, fields: [:script].join(',')).first).to_not(include('order', 'name'))
      end
    end
  end

  describe '.rule' do
    it do
      sleep 1
      expect(client.rule(enabled_rule['id'])).to(
        include('stage' => enabled_rule['stage'], 'order' => enabled_rule['order'], 'script' => enabled_rule['script'])
      )
    end

    context '#filters' do
      let(:rule_include) do
        sleep 1
        client.rule(enabled_rule['id'], fields: [:stage, :order, :script].join(','))
      end
      let(:rule_not_include) do
        sleep 1
        client.rule(enabled_rule['id'], fields: :stage, include_fields: false)
      end

      it do
        sleep 1
        expect(rule_include).to(include('stage', 'order', 'script'))
      end

      it do
        sleep 1
        expect(rule_not_include).to(include('order', 'script'))
        expect(rule_not_include).to_not(include('stage'))
      end
    end
  end

  describe '.create_rule' do
    let(:name) { Faker::Lorem.word }
    let(:order) { rand(21..30) }
    let(:stage) { 'login_success' }
    let(:script) { 'function(test)' }
    let(:enabled) { false }
    let!(:rule) do
      sleep 1
      client.create_rule(name, script, order, enabled, stage)
    end
    it do
      sleep 1
      expect(rule).to include('name' => name, 'stage' => stage, 'order' => order, 'script' => script)
    end
  end

  describe '.delete_rule' do
    it do
      sleep 1
      expect { client.delete_rule(enabled_rule['id']) }.to_not raise_error
    end
    it do
      sleep 1
      expect { client.delete_rule '' }.to raise_error(Auth0::InvalidParameter)
    end
  end

  describe '.update_rule' do
    it do
      sleep 1
      expect(client.update_rule(disabled_rule['id'], enabled: true)).to(include('enabled' => true))
    end
  end
end

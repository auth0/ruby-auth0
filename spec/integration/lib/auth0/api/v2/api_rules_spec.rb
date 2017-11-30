require 'spec_helper'
describe Auth0::Api::V2::Rules do
  attr_reader :client, :enabled_rule, :disabled_rule

  before(:all) do
    @client = Auth0Client.new(v2_creds)
    suffix = Faker::Lorem.word
    script = 'function (user, context, callback) { callback(null, user, context);}'
    stage = 'login_success'
    @enabled_rule = client.create_rule("Enabled Rule #{suffix}", script, rand(1..10), true, stage)
    @disabled_rule = client.create_rule("Disabled Rule #{suffix}", script, rand(11..20), false, stage)
  end

  after(:all) do
    rules = client.rules
    rules.each do |rule|
      client.delete_rule(rule['id'])
    end
  end

  describe '.rules' do
    let(:rules) { client.rules }

    it { expect(rules.size).to be > 0 }

    context '#filters' do
      it do
        expect(client.rules(enabled: true).size).to be 1
      end

      it do
        expect(client.rules(enabled: false).size).to be 1
      end

      it do
        expect(client.rules(enabled: true, fields: [:script, :order].join(',')).first).to(include('script', 'order'))
      end
      it do
        expect(client.rules(enabled: true, fields: [:script].join(',')).first).to_not(include('order', 'name'))
      end
    end
  end

  describe '.rule' do
    it do
      expect(client.rule(enabled_rule['id'])).to(
        include('stage' => enabled_rule['stage'], 'order' => enabled_rule['order'], 'script' => enabled_rule['script'])
      )
    end

    context '#filters' do
      let(:rule_include) { client.rule(enabled_rule['id'], fields: [:stage, :order, :script].join(',')) }
      let(:rule_not_include) { client.rule(enabled_rule['id'], fields: :stage, include_fields: false) }

      it do
        expect(rule_include).to(include('stage', 'order', 'script'))
      end

      it do
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
    let!(:rule) { client.create_rule(name, script, order, enabled, stage) }
    it { expect(rule).to include('name' => name, 'stage' => stage, 'order' => order, 'script' => script) }
  end

  describe '.delete_rule' do
    it { expect { client.delete_rule(enabled_rule['id']) }.to_not raise_error }
    it { expect { client.delete_rule '' }.to raise_error(Auth0::InvalidParameter) }
  end

  describe '.update_rule' do
    it { expect(client.update_rule(disabled_rule['id'], enabled: true)).to(include('enabled' => true)) }
  end
end

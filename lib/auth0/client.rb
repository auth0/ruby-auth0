# frozen_string_literal: true

module Auth0
  class Management
    # @param base_url [String, nil]
    # @param token [String]
    # @param timeout [Float, nil] Request timeout in seconds.
    # @param max_retries [Integer, nil] Maximum number of request retries.
    # @param headers [Hash, nil] Additional headers to include in requests.
    #
    # @return [void]
    def initialize(token:, base_url: nil, timeout: nil, max_retries: nil, headers: nil)
      raw_client_opts = {
        base_url: base_url || Auth0::Environment::DEFAULT,
        headers: {
          "X-Fern-Language" => "Ruby",
          Authorization: "Bearer #{token}"
        }.merge(headers || {})
      }
      raw_client_opts[:timeout] = timeout if timeout
      raw_client_opts[:max_retries] = max_retries if max_retries

      @raw_client = Auth0::Internal::Http::RawClient.new(**raw_client_opts)
    end

    # @return [Auth0::Actions::Client]
    def actions
      @actions ||= Auth0::Actions::Client.new(client: @raw_client)
    end

    # @return [Auth0::Branding::Client]
    def branding
      @branding ||= Auth0::Branding::Client.new(client: @raw_client)
    end

    # @return [Auth0::ClientGrants::Client]
    def client_grants
      @client_grants ||= Auth0::ClientGrants::Client.new(client: @raw_client)
    end

    # @return [Auth0::Clients::Client]
    def clients
      @clients ||= Auth0::Clients::Client.new(client: @raw_client)
    end

    # @return [Auth0::ConnectionProfiles::Client]
    def connection_profiles
      @connection_profiles ||= Auth0::ConnectionProfiles::Client.new(client: @raw_client)
    end

    # @return [Auth0::Connections::Client]
    def connections
      @connections ||= Auth0::Connections::Client.new(client: @raw_client)
    end

    # @return [Auth0::CustomDomains::Client]
    def custom_domains
      @custom_domains ||= Auth0::CustomDomains::Client.new(client: @raw_client)
    end

    # @return [Auth0::DeviceCredentials::Client]
    def device_credentials
      @device_credentials ||= Auth0::DeviceCredentials::Client.new(client: @raw_client)
    end

    # @return [Auth0::EmailTemplates::Client]
    def email_templates
      @email_templates ||= Auth0::EmailTemplates::Client.new(client: @raw_client)
    end

    # @return [Auth0::EventStreams::Client]
    def event_streams
      @event_streams ||= Auth0::EventStreams::Client.new(client: @raw_client)
    end

    # @return [Auth0::Flows::Client]
    def flows
      @flows ||= Auth0::Flows::Client.new(client: @raw_client)
    end

    # @return [Auth0::Forms::Client]
    def forms
      @forms ||= Auth0::Forms::Client.new(client: @raw_client)
    end

    # @return [Auth0::UserGrants::Client]
    def user_grants
      @user_grants ||= Auth0::UserGrants::Client.new(client: @raw_client)
    end

    # @return [Auth0::Groups::Client]
    def groups
      @groups ||= Auth0::Groups::Client.new(client: @raw_client)
    end

    # @return [Auth0::Hooks::Client]
    def hooks
      @hooks ||= Auth0::Hooks::Client.new(client: @raw_client)
    end

    # @return [Auth0::Jobs::Client]
    def jobs
      @jobs ||= Auth0::Jobs::Client.new(client: @raw_client)
    end

    # @return [Auth0::LogStreams::Client]
    def log_streams
      @log_streams ||= Auth0::LogStreams::Client.new(client: @raw_client)
    end

    # @return [Auth0::Logs::Client]
    def logs
      @logs ||= Auth0::Logs::Client.new(client: @raw_client)
    end

    # @return [Auth0::NetworkACLs::Client]
    def network_acls
      @network_acls ||= Auth0::NetworkACLs::Client.new(client: @raw_client)
    end

    # @return [Auth0::Organizations::Client]
    def organizations
      @organizations ||= Auth0::Organizations::Client.new(client: @raw_client)
    end

    # @return [Auth0::Prompts::Client]
    def prompts
      @prompts ||= Auth0::Prompts::Client.new(client: @raw_client)
    end

    # @return [Auth0::RefreshTokens::Client]
    def refresh_tokens
      @refresh_tokens ||= Auth0::RefreshTokens::Client.new(client: @raw_client)
    end

    # @return [Auth0::ResourceServers::Client]
    def resource_servers
      @resource_servers ||= Auth0::ResourceServers::Client.new(client: @raw_client)
    end

    # @return [Auth0::Roles::Client]
    def roles
      @roles ||= Auth0::Roles::Client.new(client: @raw_client)
    end

    # @return [Auth0::Rules::Client]
    def rules
      @rules ||= Auth0::Rules::Client.new(client: @raw_client)
    end

    # @return [Auth0::RulesConfigs::Client]
    def rules_configs
      @rules_configs ||= Auth0::RulesConfigs::Client.new(client: @raw_client)
    end

    # @return [Auth0::SelfServiceProfiles::Client]
    def self_service_profiles
      @self_service_profiles ||= Auth0::SelfServiceProfiles::Client.new(client: @raw_client)
    end

    # @return [Auth0::Sessions::Client]
    def sessions
      @sessions ||= Auth0::Sessions::Client.new(client: @raw_client)
    end

    # @return [Auth0::Stats::Client]
    def stats
      @stats ||= Auth0::Stats::Client.new(client: @raw_client)
    end

    # @return [Auth0::SupplementalSignals::Client]
    def supplemental_signals
      @supplemental_signals ||= Auth0::SupplementalSignals::Client.new(client: @raw_client)
    end

    # @return [Auth0::Tickets::Client]
    def tickets
      @tickets ||= Auth0::Tickets::Client.new(client: @raw_client)
    end

    # @return [Auth0::TokenExchangeProfiles::Client]
    def token_exchange_profiles
      @token_exchange_profiles ||= Auth0::TokenExchangeProfiles::Client.new(client: @raw_client)
    end

    # @return [Auth0::UserAttributeProfiles::Client]
    def user_attribute_profiles
      @user_attribute_profiles ||= Auth0::UserAttributeProfiles::Client.new(client: @raw_client)
    end

    # @return [Auth0::UserBlocks::Client]
    def user_blocks
      @user_blocks ||= Auth0::UserBlocks::Client.new(client: @raw_client)
    end

    # @return [Auth0::Users::Client]
    def users
      @users ||= Auth0::Users::Client.new(client: @raw_client)
    end

    # @return [Auth0::Anomaly::Client]
    def anomaly
      @anomaly ||= Auth0::Anomaly::Client.new(client: @raw_client)
    end

    # @return [Auth0::AttackProtection::Client]
    def attack_protection
      @attack_protection ||= Auth0::AttackProtection::Client.new(client: @raw_client)
    end

    # @return [Auth0::Emails::Client]
    def emails
      @emails ||= Auth0::Emails::Client.new(client: @raw_client)
    end

    # @return [Auth0::Guardian::Client]
    def guardian
      @guardian ||= Auth0::Guardian::Client.new(client: @raw_client)
    end

    # @return [Auth0::Keys::Client]
    def keys
      @keys ||= Auth0::Keys::Client.new(client: @raw_client)
    end

    # @return [Auth0::RiskAssessments::Client]
    def risk_assessments
      @risk_assessments ||= Auth0::RiskAssessments::Client.new(client: @raw_client)
    end

    # @return [Auth0::Tenants::Client]
    def tenants
      @tenants ||= Auth0::Tenants::Client.new(client: @raw_client)
    end

    # @return [Auth0::VerifiableCredentials::Client]
    def verifiable_credentials
      @verifiable_credentials ||= Auth0::VerifiableCredentials::Client.new(client: @raw_client)
    end
  end
end

require_relative "auth_client"

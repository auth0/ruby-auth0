# frozen_string_literal: true

require_relative "mixins"

module Auth0
  # Unified client that provides both Authentication and Management APIs.
  #
  # Authentication methods (signup, authorization_url, validate_id_token, etc.)
  # are mixed in directly via Auth0::Mixins.
  #
  # Management methods are delegated to an internal Auth0::Management instance,
  # which is lazily created and automatically refreshed when the token changes.
  class Client
    include Auth0::Mixins

    # All management sub-client accessors from Auth0::Management.
    # When Fern adds new resources, add them here and they'll be delegated.
    # In the meantime, method_missing provides a safety net.
    MANAGEMENT_ACCESSORS = %i[
      actions
      anomaly
      attack_protection
      branding
      client_grants
      clients
      connection_profiles
      connections
      custom_domains
      device_credentials
      email_templates
      emails
      event_streams
      flows
      forms
      groups
      guardian
      hooks
      jobs
      keys
      log_streams
      logs
      network_acls
      organizations
      prompts
      refresh_tokens
      resource_servers
      risk_assessments
      roles
      rules
      rules_configs
      self_service_profiles
      sessions
      stats
      supplemental_signals
      tenants
      tickets
      token_exchange_profiles
      user_attribute_profiles
      user_blocks
      user_grants
      users
      verifiable_credentials
    ].freeze

    MANAGEMENT_ACCESSORS.each do |name|
      define_method(name) { management.public_send(name) }
    end

    # Fallback for new management accessors not yet in the explicit list
    def method_missing(method_name, *, &)
      if management.respond_to?(method_name)
        management.public_send(method_name, *, &)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      management.respond_to?(method_name, include_private) || super
    end

    # Returns the underlying Auth0::Management instance.
    # Lazily created and automatically refreshed when the token changes.
    # @return [Auth0::Management]
    def management
      current_token = get_token
      if @_management.nil? || @_management_token != current_token
        @_management_token = current_token
        opts = { token: current_token, base_url: "#{@base_uri}/api/v2" }
        opts[:timeout] = @management_timeout if @management_timeout
        opts[:max_retries] = @management_max_retries if @management_max_retries
        opts[:headers] = @management_additional_headers if @management_additional_headers
        @_management = Auth0::Management.new(**opts)
      end
      @_management
    end
  end
end

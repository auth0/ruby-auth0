# frozen_string_literal: true

module Auth0
  module AttackProtection
    module CaptchaPolicies
      class Client
        # @param client [Auth0::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve all CAPTCHA attack protection policies for the tenant, sorted by priority ascending.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.attack_protection.captcha_policies.list
        #
        # @return [Array[Auth0::Types::AttackProtectionCaptchaPolicy]]
        def list(request_options: {}, **_params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "attack-protection/captcha/policies",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::ListAttackProtectionCaptchaPoliciesResponseContent.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create a new CAPTCHA attack protection policy for the tenant. The maximum number of policies per tenant is
        # determined by the tenant's subscription.
        #
        # @param request_options [Hash]
        # @param params [Auth0::AttackProtection::CaptchaPolicies::Types::CreateAttackProtectionCaptchaPolicyRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.attack_protection.captcha_policies.create(
        #     name: "name",
        #     priority: 1,
        #     match: {},
        #     action: {}
        #   )
        #
        # @return [Auth0::Types::AttackProtectionCaptchaPolicy]
        def create(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "attack-protection/captcha/policies",
            body: Auth0::AttackProtection::CaptchaPolicies::Types::CreateAttackProtectionCaptchaPolicyRequestContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::AttackProtectionCaptchaPolicy.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve a single CAPTCHA attack protection policy for the tenant by ID.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.attack_protection.captcha_policies.get(id: "id")
        #
        # @return [Auth0::Types::AttackProtectionCaptchaPolicy]
        def get(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "attack-protection/captcha/policies/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::AttackProtectionCaptchaPolicy.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete a CAPTCHA attack protection policy for the tenant.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.attack_protection.captcha_policies.delete(id: "id")
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "attack-protection/captcha/policies/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # Partially update a CAPTCHA attack protection policy. Only the provided fields are modified. A provided match
        # or action replaces the stored value in full rather than merging with it; within action, a provider secret or
        # API key that is omitted from a provided provider block keeps its stored value.
        #
        # @param request_options [Hash]
        # @param params [Auth0::AttackProtection::CaptchaPolicies::Types::UpdateAttackProtectionCaptchaPolicyRequestContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.attack_protection.captcha_policies.update(id: "id")
        #
        # @return [Auth0::Types::AttackProtectionCaptchaPolicy]
        def update(request_options: {}, **params)
          params = Auth0::Internal::Types::Utils.normalize_keys(params)
          request_data = Auth0::AttackProtection::CaptchaPolicies::Types::UpdateAttackProtectionCaptchaPolicyRequestContent.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Auth0::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "attack-protection/captcha/policies/#{URI.encode_uri_component(params[:id].to_s)}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Auth0::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Auth0::Types::AttackProtectionCaptchaPolicy.load(response.body))
          else
            error_class = Auth0::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end

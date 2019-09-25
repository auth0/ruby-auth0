module Auth0
  module Api
    module V2
      # Methods to use the guardian endpoints
      module Guardian
        include Auth0::Mixins::Validation

        # Retrieves a list of Guardian factors.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/get_factors
        # @return [json] Returns the list of all Guardian factors.
        def guardian_factors
          get(guardian_factors_path)
        end
        alias get_guardian_factors guardian_factors

        # Retrieves a single Guardian enrollment.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/get_enrollments_by_id
        # @param enrollment_id [string] The enrollment_id of the Guardian enrollment to delete.
        # @return [json] Returns details of the Guardian enrollment.
        def guardian_enrollment(enrollment_id)
          raise Auth0::MissingParameter, 'Must supply a valid enrollment_id' if enrollment_id.to_s.empty?

          path = "#{guardian_enrollments_path}/#{enrollment_id}"
          get(path)
        end
        alias get_guardian_enrollment guardian_enrollment

        # Deletes a single Guardian enrollment given its id.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/delete_enrollments_by_id
        # @param enrollment_id [string] The enrollment_id of the Guardian enrollment to delete.
        def delete_guardian_enrollment(enrollment_id)
          raise Auth0::MissingParameter, 'Must supply a valid enrollment_id' if enrollment_id.to_s.empty?

          path = "#{guardian_enrollments_path}/#{enrollment_id}"
          delete(path)
        end

        # Retrieves SMS enrollment and verification templates.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/get_templates
        # @return [json] Returns enrollment and verification templates.
        def guardian_sms_templates
          path = "#{guardian_factors_path}/sms/templates"
          get(path)
        end
        alias get_guardian_sms_templates guardian_sms_templates

        # Updates SMS enrollment and verification SMS templates.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/put_templates
        # @param body [hash] The parameters to update.
        #
        # @return [json] Returns updated SMS enrollment and verification templates.
        def guardian_update_enrollment_verification_templates(body)
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty?

          path = "#{guardian_factors_path}/sms/templates"
          put(path, body)
        end

        # Retrieves provider configuration for AWS SNS.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/get_sns
        # @return [json] Returns provider configuration for AWS SNS.
        def guardian_sns_provider_config
          path = "#{guardian_factors_path}/push-notification/providers/sns"
          get(path)
        end
        alias get_guardian_sns_provider_config guardian_sns_provider_config

        # Updates provider configuration for AWS SNS.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/put_sns
        # @param body [hash] The parameters to update.
        #
        # @return [json] Returns updated provider configuration for AWS SNS.
        def guardian_update_sns_provider_config(body)
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty?

          path = "#{guardian_factors_path}/push-notification/providers/sns"
          put(path, body)
        end

        # Retrieves provider configuration for Twilio.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/get_twilio
        # @return [json] Returns provider configuration for Twilio.
        def guardian_twillo_provider_config
          path = "#{guardian_factors_path}/sms/providers/twilio"
          get(path)
        end
        alias get_guardian_twillo_provider_config guardian_twillo_provider_config

        # Updates provider configuration for Twilio.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/put_twilio
        # @param body [hash] The parameters to update.
        #
        # @return [json] Returns updated provider configuration for Twilio.
        def guardian_update_twillo_provider_config(body)
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty?

          path = "#{guardian_factors_path}/sms/providers/twilio"
          put(path, body)
        end

        # Creates a Guardian enrollment ticket.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/post_ticket
        # @param body [hash] User details to create enrollment ticket for.
        # @return [json] Returns details of created enrollment ticket.
        def guardian_create_enrollment_ticket(body)
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty?

          path = "#{guardian_enrollments_path}/ticket"
          post(path, body)
        end

        # Updates a Guardian factor.
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/put_factors_by_name
        # @param name [string] Name of Guardian factor to update.
        # @param body [hash] The parameters to update.
        # @return [json] Returns details of updated Guardian factor.
        def guardian_update_factor(name, body)
          raise Auth0::MissingParameter, 'Must supply a valid name' if name.to_s.empty?
          raise Auth0::InvalidParameter, 'Must supply a valid body' if body.to_s.empty?

          path = "#{guardian_factors_path}/#{name}"
          put(path, body)
        end

        private

        # Guardian API path
        def guardian_path
          @guardian_path ||= '/api/v2/guardian'
        end

        def guardian_enrollments_path
          @guardian_enrollments_path ||= "#{guardian_path}/enrollments"
        end

        def guardian_factors_path
          @guardian_factors_path ||= "#{guardian_path}/factors"
        end
      end
    end
  end
end

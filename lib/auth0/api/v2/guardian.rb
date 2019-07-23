require 'auth0/mixins/validation'

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
          path = "#{guardian_path}/factors"
          get(path)
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

        # Deletes a single Guardian enrollment given its id
        # @see https://auth0.com/docs/api/management/v2#!/Guardian/delete_enrollments_by_id
        # @param enrollment_id [string] The enrollment_id of the Guardian enrollment to delete.
        def delete_guardian_enrollment(enrollment_id)
          raise Auth0::MissingParameter, 'Must supply a valid enrollment_id' if enrollment_id.to_s.empty?

          path = "#{guardian_enrollments_path}/#{enrollment_id}"
          delete(path)
        end

        private

        # Guardian API path
        def guardian_path
          @guardian_path ||= '/api/v2/guardian'
        end

        def guardian_enrollments_path
          @guardian_enrollments_path ||= "#{guardian_path}/enrollments"
        end
      end
    end
  end
end

module Auth0
  module Mixins
    # Module to provide validation for specific data structures.
    module Validation

      # Check a roles array
      def validate_strings_array(strings)
        raise Auth0::InvalidParameter, 'Must supply an array of strings' unless strings.kind_of?(Array)
        raise Auth0::MissingParameter, 'Must supply an array of strings' if strings.empty?
        raise Auth0::InvalidParameter, 'All array elements must be strings' unless strings.all? {|str| str.is_a? String}
      end

      # Check a permissions array
      def validate_permissions_array(permissions)
        raise Auth0::InvalidParameter, 'Must supply an array of Permissions' unless permissions.kind_of?(Array)
        raise Auth0::MissingParameter, 'Must supply an array of Permissions' if permissions.empty?
        raise Auth0::InvalidParameter, 'All array elements must be Permissions' unless permissions.all? do |permission|
          permission.kind_of? Permission
        end
        permissions.map { |permission| permission.to_h }
      end

    end
  end
end

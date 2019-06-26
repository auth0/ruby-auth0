module Auth0
  module Mixins
    # Module to provide validation for specific data structures.
    module Validation

      # Check a roles array
      def validate_roles_array(roles)
        raise Auth0::InvalidParameter, 'Must supply an array of role names' unless roles.kind_of?(Array)
        raise Auth0::InvalidParameter, 'Must supply an array of role names' if roles.empty?
        raise Auth0::InvalidParameter, 'All role names must be strings' unless roles.all? {|role| role.is_a? String}
      end

      # Check a permissions array
      def validate_permissions_array(permissions)
        raise Auth0::InvalidParameter, 'Must supply an array of Permissions' unless permissions.kind_of?(Array)
        raise Auth0::InvalidParameter, 'Must supply an array of Permissions' if permissions.empty?
        raise Auth0::InvalidParameter, 'All array elements must be Permissions' unless permissions.all? do |permission|
          permission.kind_of? Permission
        end
        permissions.map { |permission| permission.to_h }
      end

    end
  end
end

module Auth0
  # Default exception in namespace of Auth0
  # if you want to catch all exceptions, then you should use this one.
  # Network exceptions are not included
  class Exception     < StandardError;    end
end
# exception for unauthorized requests, if you see it, probably Bearer Token is not set correctly
class Auth0::Unauthorized  < Auth0::Exception; end
# exception for not found resource, you query for an unexistent resource, or wrong path
class Auth0::NotFound      < Auth0::Exception; end
# exception for unknown error
class Auth0::Unsupported   < Auth0::Exception; end
# exception for server error
class Auth0::ServerError   < Auth0::Exception; end
# exception for incorrect request, you've sent wrong params
class Auth0::BadRequest    < Auth0::Exception; end
# exception for unset user_id, this might cause removal of all users, or other unexpected bahaviour
class Auth0::UserIdIsBlank < Auth0::Exception; end
# Api v2 access denied
class Auth0::AccessDenied  < Auth0::Exception; end
# Invalid parameter passed, e.g. empty where ID is required
class Auth0::InvalidParameter < Auth0::Exception; end
# Invalid Auth0 credentials either client_id/secret for API v1 or JWT for API v2/
class Auth0::InvalidCredentials < Auth0::Exception; end
# Invalid Auth0 API namespace
class Auth0::InvalidApiNamespace < Auth0::Exception; end
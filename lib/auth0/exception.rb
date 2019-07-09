module Auth0
  # Default exception in namespace of Auth0
  # if you want to catch all exceptions, then you should use this one.
  # Network exceptions are not included
  class Exception < StandardError
    attr_reader :error_data
    def initialize(message,error_data={})
      super(message)
      @error_data = error_data
    end
  end
  # Parent for all exceptions that arise out of HTTP error responses.
  class HTTPError < Auth0::Exception
    def headers
      error_data[:headers]
    end

    def http_code
      error_data[:code]
    end
  end
  # exception for unauthorized requests, if you see it,
  # probably Bearer Token is not set correctly
  class Unauthorized < Auth0::HTTPError; end
  # exception for not found resource, you query for an
  # unexistent resource, or wrong path
  class NotFound < Auth0::HTTPError; end
  # exception for unknown error
  class Unsupported < Auth0::HTTPError; end
  # exception for server error
  class ServerError < Auth0::HTTPError; end
  # exception for incorrect request, you've sent wrong params
  class BadRequest < Auth0::HTTPError; end
  # exception for timeouts
  class RequestTimeout < Auth0::Exception; end
  # exception for unset user_id, this might cause removal of
  # all users, or other unexpected behaviour
  class MissingUserId < Auth0::Exception; end
  # exception for unset client_id
  class MissingClientId < Auth0::Exception; end
  # exception for an unset parameter
  class MissingParameter < Auth0::Exception; end
  # Api v2 access denied
  class AccessDenied < Auth0::HTTPError; end
  # Invalid parameter passed, e.g. empty where ID is required
  class InvalidParameter < Auth0::Exception; end
  # Invalid Auth0 credentials either client_id/secret for API v1
  # or JWT for API v2/
  class InvalidCredentials < Auth0::Exception; end
  # Invalid Auth0 API namespace
  class InvalidApiNamespace < Auth0::Exception; end
  # Auth0 API rate-limiting encountered
  class RateLimitEncountered < Auth0::HTTPError
    def reset
      Time.at(headers['X-RateLimit-Reset']).utc
    end
  end
end

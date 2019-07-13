module Auth0
  module Api
    module V2
      # Methods to use the anomaly endpoints
      module Anomaly
        # Use this route to determine if a given IP is currently blocked
        # by the failed login to multiple user accounts trigger.
        # @see https://auth0.com/docs/api/management/v2#!/Anomaly/get_ips_by_id
        # @param ip [string] The IP to check.
        def check_if_ip_is_blocked(ip)
          raise Auth0::InvalidParameter, 'Must specify an IP' if ip.to_s.empty?

          path = "#{anomaly_path}/#{ip}"
          get(path)
        end

        # Resets an IP that is currently blocked by the failed login to multiple user accounts trigger.
        # @see https://auth0.com/docs/api/management/v2#!/Anomaly/delete_ips_by_id
        # @param ip [string] The IP to remove block.
        def remove_ip_block(ip)
          raise Auth0::InvalidParameter, 'Must specify an IP' if ip.to_s.empty?

          path = "#{anomaly_path}/#{ip}"
          delete(path)
        end

        private

        # Anomaly API path
        def anomaly_path
          @anomaly_path ||= '/api/v2/anomaly/blocks/ips'
        end
      end
    end
  end
end

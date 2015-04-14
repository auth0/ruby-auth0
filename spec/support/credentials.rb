module Credentials
	def v1_creds
		{client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"], namespace: ENV["NAMESPACE"]}
	end

	def v1_global_creds
		{client_id: ENV["GLOBAL_CLIENT_ID"], client_secret: ENV["GLOBAL_CLIENT_SECRET"], namespace: ENV["NAMESPACE"]}
	end

	def v2_creds
		{token: ENV["MASTER_JWT"], api_version: 2, namespace: ENV["NAMESPACE"]}
	end
end

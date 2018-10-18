class User < ApplicationRecord
  def self.from_token_payload(payload)
    payload['sub']
  end
end

class User < ActiveRecord::Base
  def self.from_token_payload payload
    payload["sub"]
  end
end
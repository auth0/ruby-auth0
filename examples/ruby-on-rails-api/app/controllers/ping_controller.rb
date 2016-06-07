# Ping Controller
class PingController < ApplicationController
  def ping
    render text: "All good. You don't need to be authenticated to call this"
  end
end

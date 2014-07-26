class SecuredPingController < SecuredController

  def ping
    render text: "All good. You only get this message if you're authenticated"
  end

end

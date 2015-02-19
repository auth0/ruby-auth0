class SecuredPingController < SecuredController

  def ping
  	render :json => { 
  		:message => "All good. You only get this message if you're authenticated.",
  		:user => @user
  	}
  end

end

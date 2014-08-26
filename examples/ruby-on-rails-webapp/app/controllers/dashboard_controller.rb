class DashboardController < SecuredController
  def show
    @user = session[:userinfo]
  end
end

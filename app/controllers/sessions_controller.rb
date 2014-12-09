class SessionsController < PublicController
  def new
    @user = User.find_by(params[:email])
    unless @current_user == nil
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        @login_error = "Incorrect username/password combo"
        render :new
      end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end

class SessionsController < PublicController
  def new
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
        flash[:notice] = 'Incorrect password and/or email. Please try again.'
        render :new
      end
  end

  def destroy
    log_out
    redirect_to root_url, notice: "You have logged out"
  end

end

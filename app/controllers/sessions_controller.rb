class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        render :new
        #error message
      end
  end

  def destroy
    User.find_by(params[:id]).destroy
    redirect_to login_path
  end

end

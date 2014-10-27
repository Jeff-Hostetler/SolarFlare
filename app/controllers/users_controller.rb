class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to users_url, notice: 'User was successfully created.' }
        end
      end
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :project_name,
      :join_mailing_list)
  end


end

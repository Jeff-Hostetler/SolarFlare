class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_filter :confirm_logged_in, :only => [:show]

  def index

  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          log_in(@user)
          format.html { redirect_to current_user, notice: 'Thank you. Your account has been created.'}
        else
          format.html { render :new }
        end
      end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :project_name,
      :join_mailing_list, :password, :password_confirmation)
  end


end

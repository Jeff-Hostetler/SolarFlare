class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.'}
        else
          format.html { render :new }
        end
      end
  end

  def login
    @user = User.find_by_email(params[:email])
      if @user.password == params[:password]
        give_token
      else
        redirect_to users_url
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

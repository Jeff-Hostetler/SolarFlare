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
          format.html { redirect_to @user, notice: 'Thank you. Your account has been created.'}
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

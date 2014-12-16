class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :confirm_current_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :confirm_logged_in, only:[:new, :create]

  helper WeatherHelper
  helper SensorHelper

  def index
  end

  def show
  end


  def new
    @user = User.new
    unless current_user == nil
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
        if @user.save
          log_in(@user)
          redirect_to user_tutorial_path(@user), notice: 'Thank you. Your account has been created.
                                            Please edit your profile to fill out other
                                            information that is necessary to use SolarFlare effectively.'
        else
          #for some reason this renders me at new with index in the url
          render :new
        end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:first_name,
                    :last_name, :project_name, :join_mailing_list,
                    :address, :address_city, :address_state, :address_zip,
                    :phone_number, :text_alert, :email_alert, :longitude, :latitude))
      redirect_to current_user, notice: 'Your info has been saved'
    else
      render :edit
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :project_name,
      :join_mailing_list, :password, :password_confirmation,
      :address, :address_city, :address_state, :address_zip, :phone_number,
      :text_alert, :email_alert, :longitude, :latitude)
  end


  def confirm_current_user
    unless @user.id == current_user.id
      raise AccessDenied
    end
  end

end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :confirm_current_user, only: [:show, :edit, :update, :destroy]
  before_action :index_only_admin, only: [:index]
  skip_before_action :confirm_logged_in, only:[:new, :create]

  include WeatherHelper
  include SensorHelper

  def index
    @users = User.all
    @pivotal_project = Tracker.new.pivotal_project(current_user)
    @pivotal_stories = Tracker.new.pivotal_stories(current_user)
  end

  def show
    unless (@user.address_zip == nil) || (@user.address_zip.lstrip.empty?)
      @data_past_cloud_cover = [[Time.now.to_date, weather_x_days_ago_hash(0)["cloudCover"]],
      [(Time.now-1.day).to_date, weather_x_days_ago_hash(1)["cloudCover"]],
      [(Time.now-2.day).to_date, weather_x_days_ago_hash(2)["cloudCover"]],
      [(Time.now-3.day).to_date, weather_x_days_ago_hash(3)["cloudCover"]],
      [(Time.now-4.day).to_date, weather_x_days_ago_hash(4)["cloudCover"]],
      [(Time.now-5.day).to_date, weather_x_days_ago_hash(5)["cloudCover"]],
      [(Time.now-6.day).to_date, weather_x_days_ago_hash(6)["cloudCover"]],
      [(Time.now-7.day).to_date, weather_x_days_ago_hash(7)["cloudCover"]],
      ]
    end

  end


  def new
    @user = User.new
    unless current_user == nil
      redirect_to current_user
    end
  end

  def create
    @user = User.new(user_params)
        if @user.save
          log_in(@user)
          redirect_to edit_user_path(@user), notice: 'Thank you. Your account has been created.
                                            Please edit your profile to fill out other
                                            information that is necessary to use SolarFlare effectively.'
        else
          #for some reason this renders me at new with index in the url
          render :new
        end
  end

  def edit

  end

  def update
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
    unless (@user.id == current_user.id) || (current_user.admin == true)
      raise AccessDenied
    end
  end

  def index_only_admin
    unless current_user.admin == true
      raise AccessDenied
    end
  end

  def pivotal
    if current_user.admin  == true
      @pivotal_project = Tracker.new.pivotal_project(current_user)
      @pivotal_stories = Tracker.new.pivotal_stories(current_user)
    end
  end
end

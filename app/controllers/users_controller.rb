class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_filter :confirm_logged_in, :only => [:show, :edit]

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
        if @user.save
          log_in(@user)
          redirect_to current_user, notice: 'Thank you. Your account has been created.
                                            Please edit your profile to fill out other
                                            information at your convenience.'
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
      @user.update(user_params)
      redirect_to current_user, notice: 'Your info has been saved'
    end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :project_name,
      :join_mailing_list, :password, :password_confirmation, :address_street_number,
      :address_street, :address_city, :address_state, :address_zip, :phone_number,
      :text_alert, :email_alert)
  end


end

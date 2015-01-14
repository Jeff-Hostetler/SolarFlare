class WeatherController<ApplicationController
  before_action do
    @user = User.find(params[:user_id])
  end
  before_action :confirm_current_user

  def daily
    if (@user.address_zip != nil)
      @forecast = Forecaster.new(@user, Time.current)
      @forecast.get_forecast
    end
  end

  def cloud_coverage
    if (@user.address_zip != nil)
      @next_week_cloud_data = Forecaster.new(@user, Time.current).next_week_cloud_data
    end
  end


  private

  def confirm_current_user
    unless (@user.id == current_user.id) || (current_user.admin == true)
      raise AccessDenied
    end
  end

end

class WeatherController<ApplicationController
  before_action do
    @user = User.find(params[:user_id])
  end
  before_action :confirm_current_user

  def weekly
  end

  def daily
  end

  def cloud_coverage
  end

  private

  def confirm_current_user
    unless @user.id == current_user.id
      raise AccessDenied
    end
  end

end

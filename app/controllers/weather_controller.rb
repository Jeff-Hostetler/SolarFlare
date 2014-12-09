class WeatherController<ApplicationController
  before_action do
    @user = User.find(params[:user_id])
    unless current_user != nil
      redirect_to root_path
    end
  end

  def weekly
  end

  def daily
  end

  def cloud_coverage
  end

end

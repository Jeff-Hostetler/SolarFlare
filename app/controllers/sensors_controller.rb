class SensorsController<ApplicationController
  helper SensorHelper
  before_action do
    @user = User.find(params[:user_id])
  end
  before_action :confirm_current_user

  def current_reading
    @sensor = @user.sensors.all
  end

  private

  def confirm_current_user
    unless @user.id == current_user.id
      raise AccessDenied
    end
  end

end

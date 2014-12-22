class SensorsController<ApplicationController
  helper SensorHelper
  before_action do
    @user = User.find(params[:user_id])
  end
  before_action :confirm_current_user

  skip_before_action :verify_authenticity_token

  def current_reading
    @sensor = @user.sensors.all
  end

  def create
    @sensor = @user.sensors.new(params.permit(:user_id, :data_point))
    @sensor.save
    redirect_to users_path
  end

  private

  def confirm_current_user
    unless (@user.id == current_user.id) || (current_user.admin == true)
      raise AccessDenied
    end
  end

end

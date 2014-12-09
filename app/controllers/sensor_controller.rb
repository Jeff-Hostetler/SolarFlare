class SensorController<ApplicationController
  helper SensorHelper
  before_action do
    @user = current_user
  end

  def current_reading
  end

end
